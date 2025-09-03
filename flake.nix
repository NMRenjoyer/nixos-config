{
  description = "default flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
        url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixcraft = {
      url = "github:loystonpais/nixcraft";
    };
  };
  outputs = {self, nixpkgs, home-manager, plasma-manager, ... }: let
    lib = nixpkgs.lib;
    pkgs = import nixpkgs { inherit (systemSettings) system; };
    username = "dcreetz";
    # system = "x86_64-linux";
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
      browser = "firefox";
      editor = "neovim";
      font = "JetBrainsMono Nerd Font Mono";
      fontPkg = pkgs.nerd-fonts.jetbrains-mono;
    };
  in {
    nixosConfigurations = {
      nixos-desktop = lib.nixosSystem {
        # inherit systemSettings
	modules = [
	  ./configuration.nix 
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
	    home-manager.users."${username}" = ./home.nix;
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
  };
}
