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
  };
  outputs = {self, nixpkgs, home-manager, plasma-manager, ... }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    username = "dcreetz";
  in {
    nixosConfigurations = {
      nixos-desktop = lib.nixosSystem {
        inherit system;
	modules = [
	  ./configuration.nix 
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
	    home-manager.users."${username}" = ./home.nix;
	  }
        ];
      };
    };
  };
}
