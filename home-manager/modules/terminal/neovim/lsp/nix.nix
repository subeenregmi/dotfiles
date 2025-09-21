{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
          settings = {
            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };
            options = {
              nixos = {
                expr = "(import <nixpkgs/nixos/lib/eval-config.nix> { modules = [ /etc/nixos/configuration.nix /etc/nixos/hardware-configuration.nix ]; }).options";
              };
              home_manager = {
                expr = "(import <home-manager/modules> { configuration = ~/.config/home-manager/home.nix; pkgs = import <nixpkgs> {}; }).options";
              };
            };
          };
        };
      };
    };

    lsp-format = {
      enable = true;
    };
  };
}
