{
  programs.nixvim.plugins.highlight-colors = {
    enable = true;
    settings = {
      render = "virtual";
	  virtual_symbol = "⬛";
	  virtual_symbol_prefix = " ";
	  virtual_symbol_suffix = "";
	  virtual_symbol_position = "eow";
	  enable_tailwind = true;
    };
  };
}
