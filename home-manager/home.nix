{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.username = "zenna";
  home.homeDirectory = "/home/zenna";

  home.file.".config" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [
    #important
    wezterm

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
    tldr
    atuin
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

  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

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

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {add_newline = false;};
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "eza";
      cat = "bat";
    };

    bashrcExtra = ''
      if [[ -z "$ZELLIJ" ]]; then
          if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
              zellij attach -c
          else
              zellij
          fi

          if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
            exit
          fi
      fi
      set -o vi
      eval "$(starship init bash)"
    '';
  };

  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
    };
    "org/gnome/desktop/input-sources".xkb-options = ["caps:ctrl_modifier"];
  };
  fonts.fontconfig.enable = true;

  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
