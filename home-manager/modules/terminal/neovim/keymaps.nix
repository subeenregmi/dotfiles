{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      {
        action = "<cmd>Telescope lsp_definitions<CR>";
        key = "gd";
        options = {
          silent = true;
          noremap = true;
        };
      } 

      {
        action = "<cmd>Telescope lsp_references<CR>";
        key = "gr";
        options = {
          silent = true;
          noremap = true;
        };
      } 

      {
        action = "<cmd>IncRename ";
        key = "gR";
        options = {
          silent = true;
          noremap = true;
        };
      } 

      {
        action.__raw = "vim.lsp.buf.hover";
        key = "K";
        options = {
          silent = true;
          noremap = true;
        };
      } 

      {
        action.__raw = "vim.lsp.buf.implementation";
        key = "gi";
        options = {
          silent = true;
          noremap = true;
        };
      } 

      {
        action.__raw = "vim.lsp.buf.type_definition";
        key = "gt";
        options = {
          silent = true;
          noremap = true;
        };
      } 

      {
        action = "<cmd>term make<CR>";
        key = "<leader>r";
        options = {
          silent = true;
          noremap = true;
        };
      } 
    ];
  };
}
