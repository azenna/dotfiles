{pkgs, ...}: {
  home.file.".config/wallpapers" = {
    source = ./config;
    recursive = true;
  };
}
