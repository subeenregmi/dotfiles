let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/main.tar.gz") {};
in
{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        settings = {
          "media.av1.enabled" = false;
          "media.hardware-video-decoding.force-enable" = true;
        };
        
        extensions = {
          packages = with nur-no-pkgs.repos.rycee.firefox-addons; [
            ublock-origin
            metamask
          ];
        };
      };
    };
  };
}
