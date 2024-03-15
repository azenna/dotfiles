{pkgs, ...}: {
  home.file.".config/rofi/" = {
    source = ../rofi;
    recursive = true;
  };
  home.packages = with pkgs; [
    rofi
    (import ./scripts/launcher.nix {inherit pkgs;})
  ];
}
