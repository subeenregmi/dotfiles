{
  programs.nixvim = {
    plugins.image = {
      enable = true;
      settings.integrations = {
        markdown = {
            enabled = true;
        };
        html = {
            enabled = true;
        };
        css = {
            enabled = true;
        };
      };
    };

    dependencies.imagemagick = {
      enable = true;
    };
  };
  
}
