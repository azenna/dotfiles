{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [./zellij ./kitty ./nvim ./nu ./starship ./wallpapers];
  home.username = "zenna";
  home.homeDirectory = "/home/zenna";

  home.packages = with pkgs; [
    spotube
    #fonts
    fira-code
    fira-code-symbols
    fira-code-nerdfont

    #scripts
    (import ./scripts/rebuild.nix {inherit pkgs;})
    (import ./scripts/home_install.nix {inherit pkgs;})

    #development
    gcc
    ghc
    rustup
    go
    zig
    cabal-install
    python3

    llvmPackages_17.stdenv
    clang-tools_17
    stylish-haskell
    haskellPackages.fourmolu
    black
    alejandra
    nodePackages.prettier
    stylua

    nil
    nodePackages_latest.pyright
    vscode-langservers-extracted
    gopls
    haskell-language-server
    lua-language-server

    haskellPackages.threadscope

    #tui
    yazi
    glow
    fzf
    btop

    #cli
    atuin
    tldr
    azure-cli
    pandoc
    bitwarden-cli
    xclip
    neofetch
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    bat
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    #web
    firefox
    chromium

    #documents
    libreoffice
    evince

    # archives
    zip
    xz
    unzip
    p7zip

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # it provides the command `nom` works just like `nix`
    nix-output-monitor

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "azenna";
    userEmail = "zrallwein@gmail.com";
    extraConfig.pull.rebase = true;
  };

  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "eza";
      cat = "bat";
    };

    bashrcExtra = ''
      set -o vi
      eval "$(starship init bash)"
      eval "$(atuin init bash --disable-up-arrow)"
    '';
  };

  fonts.fontconfig.enable = true;

  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
