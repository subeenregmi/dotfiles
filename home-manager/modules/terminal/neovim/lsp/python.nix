{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        pyright = {
          enable = true;
        };
      };
    };

    conform-nvim = {
      settings = {
        formatters_by_ft = {
          python = [ "ruff" ];
        };    
      };
    };

    lint = {
      lintersByFt = {
        python = [ "ruff" ];
      };
    };
  };

  home.packages = with pkgs; [
    ruff
  ];
}
