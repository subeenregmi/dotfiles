{
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      lsp = {
	    override = {
		  "vim.lsp.util.convert_input_to_markdown_lines" = false;
		  "vim.lsp.util.stylize_markdown" = false;
		};
	  };
      notify = {
        enabled = true;
      };
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = true;
        lsp_doc_border = true;
      };

    # throttle = 10;
    };
  };
}
