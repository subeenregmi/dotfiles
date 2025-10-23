{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = ''
        function(bufnr)
            if vim.bo[bufnr].filetype == "go" then
                return
            end
            
            return {timeout_ms = 500}
        end
      '';

      format_after_save = ''
        function(bufnr)
            if vim.bo[bufnr].filetype ~= "go" then
                return
            end
            
            return {timeout_ms = 500}
        end
      '';
    };
  };
}
