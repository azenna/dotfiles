{
  description = "";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } : 
  {
    nixosConfigurations = {
      ephemerate = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/ephemerate/configuration.nix
          ({pkgs, ...}: {

            nix.settings.experimental-features = [ "nix-command" "flakes" ];
            networking.hostName = "ephemerate"; # Define your hostname.

            # Enable networking
            networking.networkmanager.enable = true;

            # Set your time zone.
            time.timeZone = "America/Chicago";

            # Select internationalisation properties.
            i18n.defaultLocale = "en_US.UTF-8";

            i18n.extraLocaleSettings = {
              LC_ADDRESS = "en_US.UTF-8";
              LC_IDENTIFICATION = "en_US.UTF-8";
              LC_MEASUREMENT = "en_US.UTF-8";
              LC_MONETARY = "en_US.UTF-8";
              LC_NAME = "en_US.UTF-8";
              LC_NUMERIC = "en_US.UTF-8";
              LC_PAPER = "en_US.UTF-8";
              LC_TELEPHONE = "en_US.UTF-8";
              LC_TIME = "en_US.UTF-8";
            };

            services.xserver.enable = true;
            services.xserver.displayManager.sddm.enable = true;
            services.xserver.desktopManager.plasma5.enable = true;

            services.xserver = {
                xkb.layout = "us";
                xkb.variant = "";
            };

            # Enable CUPS to print documents.
            services.printing.enable = true;

            # Enable sound with pipewire.
            sound.enable = true;
            hardware.pulseaudio.enable = false;
            security.rtkit.enable = true;
            services.pipewire = {
              enable = true;
              alsa.enable = true;
              alsa.support32Bit = true;
              pulse.enable = true;
            };

            # Define a user account. Don't forget to set a password with ‘passwd’.
            users.users.zenna = {
              isNormalUser = true;
              description = "Zenna Allwein";
              extraGroups = [ "networkmanager" "wheel" ];
            };

            # Allow unfree packages
            nixpkgs.config.allowUnfree = true;

            programs.dconf.enable = true;
          })
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zenna = import ./home-manager/home.nix;

          }
        ];
      };
    };
  };
}
