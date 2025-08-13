{ config, pkgs, ... }:

{
  home.username = "dcreetz";
  home.homeDirectory = "/home/dcreetz";
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
  
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    fonts.general = {
    	family = "JetBrainsMono Nerd Font Mono";
	pointSize = 12;
    };
    workspace = {
      lookAndFeel = "org.kde.breezetwilight.desktop";
    };
    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Alt+K";
      command = "konsole";
    };

  };
  programs.konsole = {
    enable = true;
    defaultProfile = "Default";
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
    };
  };
  # install and configure neovim
  programs.neovim = {
    enable = true;
  };
  # install and configure git
  programs.git = {
    enable = true;
    userName = "NMREnjoyer";
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
