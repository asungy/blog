{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    gomod2nix = {
      url = "github:nix-community/gomod2nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = inputs: with inputs;
    (flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              (final: prev: {
                # gomod2nix does not work with 1.23.
                # Ref: https://github.com/nix-community/gomod2nix/issues/117#issuecomment-2321433019
                go = prev.go_1_22;
              })
              gomod2nix.overlays.default
            ];
          };

          # The current default sdk for macOS fails to compile go projects, so we use a newer one for now.
          # This has no effect on other platforms.
          callPackage = pkgs.darwin.apple_sdk_11_0.callPackage or pkgs.callPackage;
        in
        {
          packages.default = pkgs.buildGoApplication {
            pname = "blog";
            version = "0.0.0";
            src = ./.;
            modules = ./gomod2nix.toml;
            preBuild = ''
              ${pkgs.templ}/bin/templ generate
            '';
          };

          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              gomod2nix
              tailwindcss
              templ
            ];
          };
        })
    );
}
