{pkgs, ...}: {
  imports = [../common ./hypr ./rofi ./eww];
  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };
  home.packages = with pkgs; [
    copyq
    grim
    brightnessctl
  ];
}
