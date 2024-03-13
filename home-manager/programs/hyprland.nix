{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprpaper
    wofi
    copyq
  ];
  wayland.windowManager.hyprland.enable = true;
}
