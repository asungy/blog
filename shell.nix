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
      alias jup='jupyter lab --notebook-dir=notebooks'
      alias serve='hugo build && pagefind --site public && hugo server --disableFastRender'
      alias venv='source ./venv/bin/activate && pip install -r requirements.txt'
    '';
  }
