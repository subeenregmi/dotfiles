return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		-- or if using `mini.icons`
		-- { "echasnovski/mini.icons" },
	},
	opts = {
		show_icons = true,
		leader_key = ";", -- Recommended to be a single key
		buffer_leader_key = "m", -- Per Buffer Mappings
	},
	config = function(_, opts)
		vim.api.nvim_set_hl(0, "ArrowFileIndex", { fg = "#ffcc00", bold = true })
		require("arrow").setup(opts)
	end,
}
