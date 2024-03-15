{
  pkgs,
  hyprlock,
  ...
}: {
  imports = [hyprlock.homeManagerModules.hyprlock];
  home.file.".config/hypr" = {
    source = ./config;
    recursive = true;
  };
  home.packages = with pkgs; [
    hyprlock
    hyprpaper
  ];
  programs.hyprlock.enable = true;
  wayland.windowManager.hyprland.enable = true;
}
