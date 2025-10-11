vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>gx", "<esc>:URLOpenUnderCursor<cr>")

local telescope_builtin = require("telescope.builtin")

-- lsp mappings (inside buffer)
vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set("n", "gr", telescope_builtin.lsp_references, {})
vim.keymap.set("n", "gR", ":IncRename ", {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})

-- telescope mappings
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
vim.keymap.set("n", "<leader>fo", telescope_builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fn", function()
	require("telescope").extensions.notify.notify()
end, {})
vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics, {})

-- nvim-tree mappings
vim.keymap.set("n", "<leader>to", ":NvimTreeOpen<CR>", {})
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", {})
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>", {})
vim.keymap.set("n", "<leader>tc", ":NvimTreeCollapse<CR>", {})
vim.keymap.set("n", "<leader>tF", ":NvimTreeFindFile<CR>", {})

-- debugging mappings
local dap = require("dap")
local dapui = require("dapui")
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dd", dap.continue, {})
vim.keymap.set("n", "<leader>dc", dapui.close, {})
vim.keymap.set("n", "<leader>dt", dapui.toggle, {})
vim.keymap.set("n", "<leader>dT", function()
	require("dap-go").debug_test()
end)

-- copilot mappings
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", {})
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", {})

--aerial mappings
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
	require("menu.utils").delete_old_menus()

	vim.cmd.exec('"normal! \\<RightMouse>"')

	-- clicked buf
	local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

	require("menu").open(options, { mouse = true })
end, {})

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

local neotest = require("neotest")
vim.keymap.set("n", "<leader>rt", neotest.run.run, {})
vim.keymap.set("n", "<leader>rf", function()
	neotest.run.run(vim.fn.expand("%"))
end, {})
vim.keymap.set("n", "<leader>rs", neotest.run.stop, {})
vim.keymap.set("n", "<leader>ro", function()
	neotest.output.open({ enter = true, auto_close = true })
end, {})
vim.keymap.set("n", "<leader>ra", neotest.run.attach, {})
