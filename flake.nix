{
  description = "flake";

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
    
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = {self, nixpkgs, home-manager, stylix, nvf, ... }: let
    lib = nixpkgs.lib;
    # ---- SYSTEM SETTINGS ---- #
    commonSystemSettings = {
      system = "x86_64-linux";
      timezone = "America/Chicago";
      locale = "en_US.UTF-8";
    };
    
    pkgs = import nixpkgs { inherit (commonSystemSettings) system; };

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
      nixos-desktop = let
        systemSettings = commonSystemSettings // {
	  hostname = "nixos-desktop";
	};  
      in lib.nixosSystem {
	modules = [
	  ./${systemSettings.hostname}_configuration.nix 
	  stylix.nixosModules.stylix
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.backupFileExtension = "backup";
	    home-manager.users."${userSettings.username}" = {
              imports = [
	        nvf.homeManagerModules.default
	        ./home.nix
	      ];
	    };
	    home-manager.extraSpecialArgs = {
	      inherit systemSettings;
	      inherit userSettings;
#	      inherit nvf;
	    };
	  }
        ];
        specialArgs = {
	  inherit systemSettings;
	  inherit userSettings;
	};
      };
      nixos-laptop = let
        systemSettings = commonSystemSettings // {
	  hostname = "nixos-laptop";
	};
      in lib.nixosSystem {
        modules = [ 
	  ./${systemSettings.hostname}_configuration.nix
	  stylix.nixosModules.stylix
#	  nvf.homeManagerModules.default
	  home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
	    home-manager.users."${userSettings.username}" = {
              imports = [
	        nvf.homeManagerModules.default
	        ./home.nix
	      ];
	    };
            home-manager.extraSpecialArgs = {
              inherit systemSettings;
	      inherit userSettings;
	      inherit nvf;
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
