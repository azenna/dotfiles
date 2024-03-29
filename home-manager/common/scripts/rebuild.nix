{pkgs}:
pkgs.writeShellScriptBin "rebuild" ''
  #!/usr/bin/env bash
  #
  set -e

  # cd to your config dir
  pushd ~/.dotfiles/

  # Autoformat your nix files
  alejandra . >/dev/null

  # Shows your changes
  git diff -U0 *

  echo "NixOS Rebuilding..."

  # Rebuild, output simplified errors, log trackebacks
  sudo nixos-rebuild switch --flake ~/.dotfiles/#ephemerate &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

  # Get current generation metadata
  current=$(sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | grep current)

  # Commit all changes witih the generation metadata
  git add .
  git commit -m "$current"

  # Back to where you were
  popd
''
