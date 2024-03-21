{
  description = "Python 3.11 cuda development environment";
  inputs = {
    nixpkgs = {url = "github:nixos/nixpkgs/nixos-unstable";};
    flake-utils = {url = "github:numtide/flake-utils";};
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.cudaSupport = true;
      };
    in {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          git
          gitRepo
          gnupg
          autoconf
          curl
          procps
          gnumake
          util-linux
          m4
          gperf
          unzip
          cudatoolkit
          linuxPackages.nvidia_x11
          libGLU
          libGL
          xorg.libXi
          xorg.libXmu
          freeglut
          xorg.libXext
          xorg.libX11
          xorg.libXv
          xorg.libXrandr
          zlib
          ncurses5
          stdenv.cc
          binutils
          python311
          python311Packages.pip
          python311Packages.numpy
          python311Packages.pytorch-bin
          python311Packages.torchvision-bin
          python311Packages.tqdm
        ];

        shellHook = ''
          export EXTRA_CCFLAGS="-I/usr/include"
          export CUDA_PATH=${pkgs.cudatoolkit}
          # export LD_LIBRARY_PATH=${pkgs.linuxPackages.nvidia_x11}/lib
          export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
        '';
      };
    });
}
