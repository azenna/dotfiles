{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprpaper
    wofi
    copyq
  ];
}
