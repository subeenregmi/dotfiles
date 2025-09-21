{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = { action = "find_files"; };
      "<leader>fg" = { action = "live_grep"; };
      "<leader>fb" = { action = "buffers"; };
      "<leader>fh" = { action = "help_tags"; };
      "<leader>fo" = { action = "old_files"; };
      "<leader>fd" = { action = "diagnostics"; };
    };
  };
}
