{pkgs}:
pkgs.writeShellScriptBin "home_install" ''
  #!/usr/bin/env bash

  set -e
  # cd to your home-manager dir
  pushd ~/nixos/home-manager/

  $EDITOR ./home.nix

  # see ./rebuild.nix
  rebuild

  popd
''
