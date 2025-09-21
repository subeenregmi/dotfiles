{
  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    settings = {
      diagnostics = {
        enable = true;
      };
      renderer = {
        highlight_git = true;
        icons = {
          show = {
            file = true;
            folder = true;
            folder_arrow = true;
            git = true;
          };
          glyphs = {
            default = "";
            symlink = "";
            git = {
              unstaged = "M";
              staged = "S";
              unmerged = "UM";
              renamed = "R";
              deleted = "D";
              untracked = "U";
              ignored = "I";
            };
            folder = {
			  default = "";
			  open = "";
			  empty = "";
		      empty_open = "";
			  symlink = "";
			};
          };
        };
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      action = ":NvimTreeOpen<CR>";
      key = "<leader>to";
      options = {
        silent = true;
      };
    }
    {
      action = ":NvimTreeToggle<CR>";
      key = "<leader>tt";
      options = {
        silent = true;
      };
    }
    {
      action = ":NvimTreeFocus<CR>";
      key = "<leader>tf";
      options = {
        silent = true;
      };
    }
    {
      action = ":NvimTreeCollapse<CR>";
      key = "<leader>tc";
      options = {
        silent = true;
      };
    }
    {
      action = ":NvimTreeFindFile<CR>";
      key = "<leader>tF";
      options = {
        silent = true;
      };
    }
  ];
}
