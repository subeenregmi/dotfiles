return {
	{
		"shaunsingh/nord.nvim",
		priority = 1000,
		config = function()
			-- Example config in lua
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.g.nord_disable_background = true
			vim.g.nord_cursorline = true
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = true

			-- Load the colorscheme
			require("nord").set()

			-- vim.cmd([[colorscheme nord]])
		end,
	},
}
