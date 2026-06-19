{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "poetry" ];
    };
    shellAliases = {
      screenshot = ''
      if area=$(slurp); then 
        grim -g "$area" - | wl-copy && wl-paste > /tmp/screenshot.png && dunstify -i "/tmp/screenshot.png" "screenshotted!";
      else; 
        dunstify "failed screenshot :("; 
      fi
      '';
      claude-sp="CLAUDE_CONFIG_DIR=~/.claude-sp claude";
    };
plugins = with pkgs; [
      {
        name = "agkozak-zsh-prompt-nix";
        src = fetchFromGitHub {
          owner = "subeenregmi";
          repo = "agkozak-zsh-prompt-nix";
          rev = "v0.0.1";
          sha256 = "mqwK2CBwEZLr4ICzgj7Dm8PHHLAsVIzoEbYapDuKLgI=";
        };
        file = "agkozak-zsh-prompt.plugin.zsh";
      }
    ];
  };

}
