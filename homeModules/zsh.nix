{ ... }: 
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      update = "sudo nixos-rebuild switch --flake .";
    };
  }; 
}
