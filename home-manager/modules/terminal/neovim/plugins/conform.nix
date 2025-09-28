{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_after_save = {
        timeout_ms = 500;
      };
    };
  };
}
