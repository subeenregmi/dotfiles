{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        gopls = {
          enable = true;
        };
      };
    };

    conform-nvim = {
      settings = {
        formatters_by_ft = {
            go = [ "gofumpt" "goimports-reviser" "golines"]; 
        };

        formatters = {
          "goimports-reviser" = {
            prepend_args = [ "-rm-unused" ];
          };
        };
      };
    }; 
  };

  home.packages = with pkgs; [
    gofumpt
    goimports-reviser
    golines
  ];
}
