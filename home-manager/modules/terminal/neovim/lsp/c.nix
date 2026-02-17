{
  programs.nixvim.plugins = {
    lsp = {
      servers = {
        clangd = {
          enable = true;
        };
      };
    };
  };

  programs.nixvim.autoCmd = [
    {
      event = [ "FileType" ];
      pattern = [ "c" "cpp" ];
      callback = {
        __raw = ''
        function()
            vim.opt_local.shiftwidth = 2
            vim.opt_local.tabstop = 2
        end
       '';
      };
    }
  ];
}
