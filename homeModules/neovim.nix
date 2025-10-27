{ pkgs, ... }: 
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        extraPackages = with pkgs; [
          nil
        ];
        # Language Server Protocol setup
        lsp = {
          enable = false;
          lspconfig.enable = true;
          servers = {
            # Use nil_ls for Nix files
            nil_ls = {
              enable = true;
            };
          };
        };

        # Language configurations
/*        languages = {
          nix = {
            enable = true;
            lsp.package = pkgs.nil;
          };
        };
*/        
        # Clipboard configuration
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };
      }; 
    };
  };
}
