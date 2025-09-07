-- dependencies/packages
require("config.lazy")
require("config.keymaps")
require("config.options")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.api.nvim_set_hl(0, "ArrowFileIndex", { fg = "#ffcc00", bold = true })

-- disable copilot at start
vim.cmd("Copilot disable")
