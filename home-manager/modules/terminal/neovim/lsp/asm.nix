{ pkgs, lib, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        asm_lsp = {
          enable = false;
        };
      };
    };

    conform-nvim = {
      settings = {
        formatters_by_ft = {
          asm = [
            "asmfmt"
          ];
        };

        formatters = {
          asmfmt = {
            command = lib.getExe pkgs.asmfmt;
          };
        }; 
      };
    };
  };

  home.packages = with pkgs; [
    asmfmt
  ];
}
