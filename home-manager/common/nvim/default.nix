{pkgs, ...}: {
  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
