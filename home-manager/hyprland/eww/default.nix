{pkgs, ...}: {
  home.file.".config/eww" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [
    eww-wayland
    (import ./scripts/active_workspace.nix {inherit pkgs;})
    (import ./scripts/workspaces.nix {inherit pkgs;})
    (import ./scripts/network.nix {inherit pkgs;})
  ];
}
