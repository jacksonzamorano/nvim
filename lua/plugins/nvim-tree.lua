return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			on_attach = function(bufnr)
				local opts = { buffer = bufnr }
				local api = require("nvim-tree.api")
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
				vim.keymap.set("n", "<leader>a", api.fs.create, opts)
				vim.keymap.set("n", "<leader>r", api.fs.rename, opts)
				vim.keymap.set("n", "<leader>d", api.fs.remove, opts)
			end,
			view = { adaptive_size = true },
		})
	end,
	keys = {
		{ "<leader>ff", ":NvimTreeToggle<CR>", { noremap = true, silent = true } },
		{ "<leader>fd", ":NvimTreeFindFile<CR>", { noremap = true, silent = true } },
		{ "<leader>fe", ":NvimTreeFocus<CR>", { noremap = true, silent = true } },
	},
}
