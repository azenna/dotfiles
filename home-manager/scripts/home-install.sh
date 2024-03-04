#!/usr/bin/env bash

set -e
# cd to your home-manager dir
pushd ~/nixos/home-manager/

$EDITOR ./home.nix

$HOME/bin/nixos-rebuild.sh

popd
