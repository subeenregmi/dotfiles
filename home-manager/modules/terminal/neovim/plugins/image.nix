{
  programs.nixvim = {
    plugins.image = {
      enable = true;
    };

    dependencies.imagemagick = {
      enable = true;
    };
  };
  
}
