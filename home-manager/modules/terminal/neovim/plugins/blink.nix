{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "enter";
      };

      appearance = {
        nerd_font_variant = "mono";
      };

      completion = {
        documentation = {
          auto_show = true;
        };
      };

      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };

      fuzzy = {
        implementation = "lua";
      };
    };
  };
}
