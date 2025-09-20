{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    tmux
  ];
  home.file.".config/tmux/tmux.conf".source = ~/Personal/code/dotfiles/tmux/tmux.conf;
}
