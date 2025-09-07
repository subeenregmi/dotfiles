return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				highlights = require("nord").bufferline.highlights({
					italic = true,
					bold = true,
				}),
				options = {
					separator_style = "thin",
				},
			})

			vim.g.transparent_groups = vim.list_extend(
				vim.g.transparent_groups or {},
				vim.tbl_map(function(v)
					return v.hl_group
				end, vim.tbl_values(require("bufferline.config").highlights))
			)

			require("transparent").clear_prefix("BufferLine")
		end,
	},
}
