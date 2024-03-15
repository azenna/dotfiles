{pkgs, ...}: {
  home.file.".config/rofi" = {
    source = ./config;
    recursive = true;
  };
  home.packages = with pkgs; [
    rofi
    (import ./scripts/launcher.nix {inherit pkgs;})
  ];
}
