{ config, pkgs, userSettings, ... }:

{
  imports = [
    environment/environment.nix
  ];
  
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
  
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
    userName = "NMRenjoyer";
    userEmail = "dcreetz+github@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };


  # Vesktop - Discord alternative
  programs.vesktop = {
    enable = true;
  };
  


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
