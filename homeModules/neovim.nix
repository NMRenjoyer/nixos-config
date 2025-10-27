{ nvf, ... }: 
{
  programs.nvf = {
    enable = true;
    settings.vim = {
      # Language Server Protocol setup
      lsp = {
        enable = true;
      };

      # Language configurations
      languages = {
        nix.enable = true;
        nix.format.enable = true;
      };
      
      # Clipboard configuration
      clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
        registers = "unnamedplus";
      };
    }; 
  };  
}
