{ ... }: 
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      update = "sudo nixos-rebuild switch --flake . 2>&1 | grep -E -v 'Added input|follows|github:'";
    };
  }; 
}
