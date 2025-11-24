{ config, pkgs, ...}:
{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "20x20";
        frame_color = "#a6e3a1";
        font = "BlexMono Nerd Font 8";
        gap_size = 2;
      };

      rules = {
        min_icon_size = 64;
      };

      urgency_normal = {
        background = "#121212";
        foreground = "#cccccc";
        frame_color = "#1bfd9c";
        timeout = 10;
      };

      urgency_low = {
        background = "#121212";
        foreground = "#cccccc";
        frame_color = "#1bfd9c";
        timeout = 10;
      };

      urgency_critical = {
        background = "#121212";
        foreground = "#cccccc";
        frame_color = "#f38ba8";
        timeout = 10;
      };
    };
  };
}
