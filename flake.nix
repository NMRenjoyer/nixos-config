{
  description = "desktop flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = {self, nixpkgs, home-manager, stylix, hyprland, ... }: let
    lib = nixpkgs.lib;
    pkgs = import nixpkgs { inherit (systemSettings) system; };
    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = "x86_64-linux";
      hostname = "nixos-desktop";
      timezone = "America/Chicago";
      locale = "en_US.UTF-8";
    };

    # ---- USER SETTINGS ---- #
    userSettings = {
      username = "dcreetz";
      name = "David Reetz";
      email = "dcreetz@proton.me";
      terminal = "kitty";
      browser = "firefox";
      editor = "neovim";
      fileManager = "lf";
      font = "JetBrainsMono Nerd Font Mono";
      fontPkg = pkgs.nerd-fonts.jetbrains-mono;
    };
  in {
    nixosConfigurations = {
      nixos-desktop = lib.nixosSystem {
        # inherit systemSettings
	modules = [
	  ./configuration.nix 
	  stylix.nixosModules.stylix
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.backupFileExtension = "backup";
	    home-manager.users."${userSettings.username}" = ./home.nix;
	    home-manager.extraSpecialArgs = {
	      inherit userSettings;
	    };
	  }
        ];
        specialArgs = {
	  inherit systemSettings;
	  inherit userSettings;
	};
      };
    };
    homeConfigurations."${userSettings.username}@${systemSettings.hostname}" = home-manager.lib.homeManagerConfiguration {
      modules = [
/*        {
	  wayland.windowManager.hyprland = {
	    enable = true;
	    package = hyprland.packages.${systemSettings.system}.hyprland;
	      portalPackage = hyprland.packages.${systemSettings.system}.xdg-desktop-portal-hyprland;
	  };
        }
*/	stylix.homeModules.stylix
	./home.nix
      ];
    };
  };
}
