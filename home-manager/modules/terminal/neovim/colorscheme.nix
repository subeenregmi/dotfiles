{ pkgs, ... }:
{
  programs.nixvim.colorschemes.nord = {
    enable = false;
    settings = {
      contrast = true;
    };
  };
  
  programs.nixvim.colorschemes.catppuccin = {
    enable = false;
    settings = {
      auto_integrations = true;
    };
  };

  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "monoglow";
        src = pkgs.fetchFromGitHub {
          owner = "wnkz";
          repo = "monoglow.nvim";
          rev = "main";
          hash = "sha256-GqrD+DnzIOHeBRRWR2qszOcPt2BMfelJLrCVu+2g0Ww=";
        };
      })
    ];

    extraConfigVim = "colorscheme monoglow";
  };

}
