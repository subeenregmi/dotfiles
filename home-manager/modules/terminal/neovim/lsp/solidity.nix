let 
  unstable = import <nixos-unstable> {};
  system = builtins.currentSystem;
  solhintFlake = builtins.getFlake "/home/subeen/subeenfiles/code/dotfiles/home-manager/modules/terminal/neovim/custom/solhint";
  solhint = solhintFlake.packages.${system}.default;
in
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        solidity_ls = {
          enable = true;
          package = unstable.vscode-solidity-server;
          settings = {
            linter = "solhint";
          };
        };
      };
    }; 

    lint = {
      enable = true;
      lintersByFt = {
        solidity = [ "solhint"];
      };

      linters = {
        solhint = {
          cmd = "${solhint}/bin/solhint";
        };
      };
    };
  };
}

