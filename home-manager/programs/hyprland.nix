{
  pkgs,
  hyprlock,
  ...
}: {
  imports = [hyprlock.homeManagerModules.hyprlock];
  home.packages = with pkgs; [
    hyprlock
    hyprpaper
    rofi
    (import ../scripts/rofi/launcher.nix {inherit pkgs;})
    (import ../scripts/eww/active_workspace.nix {inherit pkgs;})
    (import ../scripts/eww/workspaces.nix {inherit pkgs;})
    copyq
  ];
  programs.hyprlock.enable = true;
  wayland.windowManager.hyprland.enable = true;
}
