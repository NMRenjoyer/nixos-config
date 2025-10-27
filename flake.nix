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
    # ...
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
      terminal = "kitty";
      browser = "firefox";
      editor = "neovim";
      fileManager = "lf";
    };

    # ---- COMMON FUNCTION TO CREATE NIXOS SYSTEMS ----
    # This function defines all the common setup (Home Manager, Stylix, nvf)
    # and takes the hostname to make the configuration specific.
    mkNixosSystem = hostname:
      let
        systemSettings = commonSystemSettings // { inherit hostname; };
        nixosModules = [
          # Host-specific hardware configuration (e.g., ./nixos-desktop_configuration.nix)
          ./${hostname}_configuration.nix

          # Common UI and configuration modules
          stylix.nixosModules.stylix

          # Home Manager setup
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users."${userSettings.username}" = {
              imports = [
                ./home.nix
                # nvf manages neovim
                nvf.homeManagerModules.default
              ];
            };
            home-manager.extraSpecialArgs = {
              inherit systemSettings;
              inherit userSettings;
            };
          }
        ];
      in lib.nixosSystem {
        modules = nixosModules;
        specialArgs = {
          inherit systemSettings;
          inherit userSettings;
        };
      };

  in {
    # ---- NIXOS CONFIGURATIONS (Now using the common function) ----
    nixosConfigurations = {
      nixos-desktop = mkNixosSystem "nixos-desktop";
      nixos-laptop = mkNixosSystem "nixos-laptop";
    };
  };
}
