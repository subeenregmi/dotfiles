return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local nord_theme = require("lualine.themes.nord")
			nord_theme.normal.c.bg = nil

			local trouble = require("trouble")
			local symbols = trouble.statusline({
				mode = "lsp_document_symbols",
				groups = {},
				title = false,
				filter = { range = true },
				format = "{kind_icon}{symbol.name:Normal}",
				-- The following line is needed to fix the background color
				-- Set it to the lualine section you want to use
				hl_group = "lualine_c_normal",
			})

			local statusline = require("arrow.statusline")

			require("lualine").setup({

				options = {
					theme = nord_theme,
					component_separators = "|",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = "" }, right_padding = 2 },
					},
					lualine_b = {
						"filename",
						"branch",
						{
							function()
								return statusline.text_for_statusline_with_icons()
							end,
						},
					},
					lualine_c = {
						"fileformat",
						{ symbols.get, cond = symbols.has },
					},
					lualine_x = {},
					lualine_y = { "filetype", "progress" },
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				tabline = {},
				extensions = {},
			})

			if os.getenv("TMUX") then
				vim.defer_fn(function()
					vim.o.laststatus = 0
				end, 0)
			end
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
