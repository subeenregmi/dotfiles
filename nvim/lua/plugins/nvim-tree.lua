return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		diagnostics = {
			enable = true,
		},
		renderer = {
			highlight_git = true,
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				glyphs = {
					default = "",
					symlink = "",
					git = {
						unstaged = "M",
						staged = "S",
						unmerged = "UM",
						renamed = "R",
						deleted = "D",
						untracked = "U",
						ignored = "I",
					},
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
					},
				},
			},
		},
	},
	config = function(_, opts)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup(opts)
	end,
}
