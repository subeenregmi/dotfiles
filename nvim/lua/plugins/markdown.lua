return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
        config = function(_, opts)
            require("render-markdown").setup(opts)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function(args)
                    vim.treesitter.start(args.buf, "markdown")
                end,
            })
        end,
    }
}

