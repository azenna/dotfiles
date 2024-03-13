{pkgs}: {
  windowManagerPackages = with pkgs; [
    hyprpaper
    wofi
    copyq
  ];
}
