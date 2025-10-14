{ pkgs, ... }:
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

        eslint = {
          enable = true;
        };
      };
    };

    conform-nvim = {
      settings = {
        formatters_by_ft = {
          typescript = [
            "prettierd"
          ];
        };
      };
    };
  };

  home.packages = with pkgs; [
    prettierd
  ];
}
