{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        html = {
          enable = true;
        };
        
        superhtml = {
          enable = true;
        };
      };
    };
  };
}

