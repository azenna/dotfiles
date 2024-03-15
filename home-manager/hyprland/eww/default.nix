{pkgs, ...}: {
  home.packages = with pkgs; [
    eww-wayland
    (import ./scripts/active_workspace.nix {inherit pkgs;})
    (import ./scripts/workspaces.nix {inherit pkgs;})
  ];
}
