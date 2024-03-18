{pkgs, ...}: {
  imports = [../common ./hypr ./rofi ./eww];
  home.packages = with pkgs; [
    copyq
    grim
    brightnessctl
  ];
}
