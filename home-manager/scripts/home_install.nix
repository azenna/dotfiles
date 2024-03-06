{pkgs}:
pkgs.writeShellScriptBin "home_install" ''
  #!/usr/bin/env bash

  set -e
  # cd to your home-manager dir
  pushd ~/.dotfiles/home-manager/

  $EDITOR ./home.nix

  # see ./rebuild.nix
  rebuild

  popd
''
