{
  pkgs,
  hyprlock,
  ...
}: {
  imports = [hyprlock.homeManagerModules.hyprlock];
  home.file.".config" = {
    source = ./config;
    recursive = true;
  };
  home.packages = with pkgs; [
    hyprlock
    hyprpaper
    eww-wayland
    rofi
    (import ./scripts/rofi/launcher.nix {inherit pkgs;})
    (import ./scripts/eww/active_workspace.nix {inherit pkgs;})
    (import ./scripts/eww/workspaces.nix {inherit pkgs;})
    copyq
  ];
  programs.hyprlock.enable = true;
  wayland.windowManager.hyprland.enable = true;
}
