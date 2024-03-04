{
  description = "adhoc jupyter flake";
  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };
  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs;
            [ (python3.withPackages (ps: with ps; [ ipython jupyter ])) ];
          shellHook = ''
            if [ ! -d ".venv" ]; then
            python3 -m venv .venv;
            fi
            source .venv/bin/activate;
            jupyter notebook'';
        };
      });
}
