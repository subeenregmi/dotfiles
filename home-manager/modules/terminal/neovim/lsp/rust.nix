let 
  unstable = import <nixos-unstable> {};
in
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
          package = unstable.rust-analyzer;
          cargoPackage = unstable.cargo;
          rustcPackage = unstable.rustc;
          rustfmtPackage = unstable.rustfmt;
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
