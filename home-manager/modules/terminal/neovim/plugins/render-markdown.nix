{
  programs.nixvim.plugins.render-markdown = {
    enable = true;
  };

  programs.nixvim.autoCmd = [ 
    {
      event = [
        "FileType"
      ];
      callback = {
        __raw = ''
            function(args)
                vim.treesitter.start(args.buf, "markdown") 
            end
        '';
      };
      pattern = "markdown";
    }
  ];
}
