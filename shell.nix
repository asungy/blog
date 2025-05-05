{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages; [
      hugo
      pagefind
    ];

    shellHook = ''
      alias serve='hugo build && pagefind --site public && hugo server --disableFastRender'
    '';
  }
