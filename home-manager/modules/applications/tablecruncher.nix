let
  system = builtins.currentSystem;
  tablecruncher = (
    builtins.getFlake "/home/subeen/subeenfiles/code/dotfiles/custom/tablecruncher"
  ).packages.${system}.default;
in {
  home.packages = [ tablecruncher ];
}
