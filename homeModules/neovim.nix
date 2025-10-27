{ pkgs, ... }: 
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        extraPackages = with pkgs; [
          nil
        ];
        # autopairing of grouping characters
        autopairs.nvim-autopairs.enable = true;
        # status line
        statusline.lualine.enable = true;
        # search and picker utility
        telescope.enable = true;
        # autocomplete
        autocomplete.nvim-cmp.enable = true;
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
