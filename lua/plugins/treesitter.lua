return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			sync_install = false,
			auto_install = false,
			highlight = { enable = true },
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"css",
				"html",
				"svelte",
				"rust"
			}
		})
	end,
}
