{pkgs, ...}: {
  home.file.".config/nu" = {
    source = ./config;
    recursive = true;
  };

  programs.nushell = {
    enable = true;
    configFile.source = ./config/nu/config.nu;
    shellAliases = {
      cat = "bat";
      l = "eza -alh";
      ll = "ls -l";
    };
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
