{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprpaper
    (import ../scripts/rofi/launcher.nix {inherit pkgs;})
    copyq
  ];
  wayland.windowManager.hyprland.enable = true;
}
