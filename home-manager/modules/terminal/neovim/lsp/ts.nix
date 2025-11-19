{ pkgs, lib,... }:
{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        ts_ls = {
          enable = true;
        };

        biome = {
          enable = true; 
        };
      };
    };

    conform-nvim = {
      settings = {
        formatters_by_ft = {
          typescript = [ 
            "biome" 
          ];

          typescriptreact = [
            "biome"
          ];
        };
        formatters = {
          biome = {
            command = "biome";
            args = [
              "check"
              "--write"
              "--unsafe"
              "--stdin-file-path"
              "$FILENAME"
            ];
            stdin = true;
          };
        };
      };
    };
  };

  programs.nixvim.autoCmd = [
    {
      event = [ "FileType" ];
      pattern = ["typescript" "typescriptreact"];
      callback = {
        __raw = ''
        function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
        end
       '';
      };
    }
  ];

  home.packages = with pkgs; [
    biome
  ];
}
