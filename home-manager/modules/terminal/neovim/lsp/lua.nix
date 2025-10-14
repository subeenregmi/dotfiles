{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        lua_ls = {
          enable = true;
        };

        stylua = {
          enable = true;
        };
      };
    };
  };
}
