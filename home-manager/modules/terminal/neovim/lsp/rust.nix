{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          installRustfmt = true;
        };
      };
    }; 


    conform-nvim = {
      settings = {
        formatters_by_ft = {
          rust = [ 
            "rustfmt" 
          ];
        };    
      };
    };
  };
}
