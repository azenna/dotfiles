{pkgs, ...}: {
  imports = [./hypr ./rofi ./eww];
  home.packages = with pkgs; [
    copyq
  ];
}
