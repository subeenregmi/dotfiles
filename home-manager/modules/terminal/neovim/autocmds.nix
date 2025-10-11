{
  programs.nixvim.autoCmd = [
  {
    event = [ "BufWinEnter" ];
    callback = {
      __raw = ''
        function(args)
          if vim.bo[args.buf].buftype == "nofile" then
            vim.bo[args.buf].filetype = ""  -- disable ftplugin/syntax/indent load
          end
        end
      '';
    };
  }
  ];
}
