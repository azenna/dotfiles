{pkgs, ...}: {
  imports = [../common ./hypr ./rofi ./eww];
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        tweaks = ["rimless" "black"];
        variant = "macchiato";
      };
    };
  };
  home.packages = with pkgs; [
    copyq
    grim
    brightnessctl
  ];
}
