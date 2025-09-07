return {
	{
		"mfussenegger/nvim-lint",

		keys = {
			{
				"<leader>l",
				function()
					require("lint").try_lint()
				end,
				desc = "Run linting for current file",
			},
		},
		opts = {
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
			linters_by_ft = {
				go = { "golangci-lint" },
				python = { "ruff" },
			},
		},
		config = function() end,
		priority = 999,
	},
}
