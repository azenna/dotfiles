{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock.url = "github:hyprwm/Hyprlock";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprlock,
    ...
  }: {
    nixosConfigurations = {
      ephemerate = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ({
            config,
            pkgs,
            ...
          }: {
            imports = [./caches];
            programs.hyprland.enable = true;
            #services.xserver.displayManager.gdm.enable = true;
            #services.xserver.desktopManager.gnome.enable = true;
            #programs.dconf.enable = true;
          })
          ./systems/ephemerate/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zenna = import ./home-manager/hyprland;
            home-manager.extraSpecialArgs = {inherit hyprlock;};
            #home-manager.users.zenna = import ./home-manager/gnome;
          }
        ];
      };
    };
  };
}
