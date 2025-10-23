{ pkgs, ... }: 
{
    programs.tmux.shell = "${pkgs.zsh}/bin/zsh";
    home.file.".config/tmux/tmux.conf".source = /home/subeen/Personal/code/dotfiles/tmux/tmux.conf;
}
