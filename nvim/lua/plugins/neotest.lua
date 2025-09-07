return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
		},
		config = function()
			local neotest_golang_opts = {} -- Specify custom configuration
			require("neotest").setup({
				adapters = {
					require("neotest-golang")(neotest_golang_opts), -- Registration
				},
				consumers = {
					notify = function(client)
						client.listeners.results = function(_, results, partial)
							if partial then
								return
							end

							local total = 0
							local passed = 0
							for _, r in pairs(results) do
								total = total + 1
								if r.status == "passed" then
									passed = passed + 1
								end
							end

							vim.notify(passed .. "/" .. total .. " tests passed.", { title = "Neotest" })
						end
					end,
				},
			})
		end,
	},
}
