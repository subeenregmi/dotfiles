{ config, pkgs, ...}:
{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "50x30";
        frame_color = "#a6e3a1";
        font = "BlexMono Nerd Font 8";
        gap_size = 2;
      };

      rules = {
        min_icon_size = 64;
      };

      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#a6e3a1";
        timeout = 10;
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#b4befe";
        timeout = 10;
      };

      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#f38ba8";
        timeout = 10;
      };
    };
  };
}
