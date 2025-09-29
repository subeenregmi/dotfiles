{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        asm_lsp = {
          enable = false;
        };
      };
    };
  };
}
