{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages; [
      hugo
      pagefind
      python312Packages.python
    ];

    env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      pkgs.stdenv.cc.cc.lib
      pkgs.libz
    ];

    shellHook = ''
      alias activate='source ./venv/bin/activate'
      alias hugo-serve='hugo build && pagefind --site public && hugo server --disableFastRender'
      alias jupyter-serve='jupyter lab --notebook-dir=notebooks'
      alias nb-to-html='jupyter nbconvert --to html'
    '';
  }
