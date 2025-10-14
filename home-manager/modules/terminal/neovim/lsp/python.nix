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
          python = [ 
            "ruff_format" 
            "ruff_organize_imports"
            "black"
          ];
        };    
      };
    };

    lint = {
      enable = true;
      lintersByFt = {
        python = [ "ruff" ];
      };

      linters = {
        ruff = {
          cmd = "${pkgs.ruff}/bin/ruff";
        };
      };
    };
  };

  home.packages = with pkgs; [
    ruff
    black
  ];
}
