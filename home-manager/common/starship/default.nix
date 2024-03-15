{pkgs, ...}: {
  home.file.".config/starship.toml" = {
    source = ./starship.toml;
  };
  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {add_newline = false;};
  };
}
