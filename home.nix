{ config, pkgs, lib, userSettings, systemSettings, ... }:

{
  imports = [
    theme/theme.nix
    basicUtils/${userSettings.fileManager}.nix
  ] ++ lib.optionals (systemSettings.hostname == "nixos-desktop") [
  ### Desktop only ###
    gaming/minecraft.nix
    # ...
  ] ++ lib.optionals (systemSettings.hostname == "nixos-laptop") [
  ### Laptop only ###
    # ...
  ];
  
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;
  home.stateVersion = "25.05";
 
  home.packages = [ 
  pkgs.wl-clipboard
  ];
  
  programs.bash.enable = true;  

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      update = "sudo nixos-rebuild switch --flake .";
    };
  };
  # install and configure neovim
  programs.${userSettings.editor} = {
    enable = true;
  };
  # install and configure git
  programs.git = {
    enable = true;
    settings = {
      user = {
	name = "NMRenjoyer";
        email = "dcreetz+github@proton.me";
      };
    };
  };


  # Vesktop - Discord alternative
  programs.vesktop = {
    enable = true;
  };
  


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
