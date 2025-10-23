{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        ts_ls = {
          enable = true;
        };
      };
    };

    conform-nvim = {
      settings = {
        formatters_by_ft = {
          typescriptreact = [
            "prettierd"
          ];
          typescript = [
            "prettierd"
          ];
        };
      };
    };

    lint = {
      enable = true;
      lintersByFt = {
        typescript = [ "eslint_d" ];
        typescriptreact = [ "eslint_d" ];
      };
    
      linters = {
        eslint_d = {
          cmd = "${pkgs.eslint_d}/bin/eslint_d";
        };
      };    
    };
  };

  home.packages = with pkgs; [
    prettierd
    eslint_d
  ];
}
