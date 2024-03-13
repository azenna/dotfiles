{
  pkgs,
  hyprlock,
  ...
}: {
  imports = [hyprlock.homeManagerModules.hyprlock];
  home.packages = with pkgs; [
    hyprlock
    rofi
    (import ../scripts/rofi/launcher.nix {inherit pkgs;})
    copyq
  ];
  programs.hyprlock.enable = true;
  wayland.windowManager.hyprland.enable = true;
}
