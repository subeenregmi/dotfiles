{
  programs.nixvim = {
    globals = {
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
      loaded_perl_provider = 0;
      loaded_ruby_provider = 0;

      inccomand = "split";
    };
    opts = {
      relativenumber = true;
      signcolumn = "yes";

      termguicolors = true;

      swapfile = false;

      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      hlsearch = false;
      expandtab = true;

      linebreak = true;

      winborder = "rounded";
      
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
    };
  };
}
