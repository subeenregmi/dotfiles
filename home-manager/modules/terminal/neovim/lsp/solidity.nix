let 
  unstable = import <nixos-unstable> {};
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
  };
}
