return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "markdown", "markdown_inline", "html", "latex" },
			highlight = { enable = true },
		},
	},
}
