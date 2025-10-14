{
  programs.nixvim.colorschemes.nord = {
    enable = false;
    settings = {
      contrast = true;
    };
  };
  
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      auto_integrations = true;
    };
  };
}
