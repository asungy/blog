{
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem(system:
      let
        overlays = [];
        pkgs-stable = import inputs.nixpkgs-stable { inherit system overlays; };
        pkgs-unstable = import inputs.nixpkgs-unstable { inherit system overlays; };
      in
      {
        devShells.default = pkgs-unstable.mkShell {
          name = "blog";

          packages = with pkgs-unstable; [
            graphviz
            pkgs-stable.hugo
            pagefind
            python312Packages.python
          ];

          env.LD_LIBRARY_PATH = pkgs-unstable.lib.makeLibraryPath [
            pkgs-unstable.stdenv.cc.cc.lib
            pkgs-unstable.zlib
          ];

          shellHook = ''
            alias activate='source ./venv/bin/activate'
            alias hugo-serve='hugo build && pagefind --site public && hugo server --disableFastRender'
            alias install='pip install -r requirements.txt'
            alias clean='rm -fr public/'
            alias jupyter-serve='jupyter lab --notebook-dir=notebooks'
            alias nb-to-html='jupyter nbconvert --to html'

            VENV_DIR="venv"
            if [ ! -d "$VENV_DIR" ]; then
                echo "Virtual environment not found. Creating at ./$VENV_DIR ..."
                python3 -m venv "$VENV_DIR"
                echo "Virtual environment created."
            fi            
          '';
        };
      }
    );
}
