return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<S-Tab>",
					clear_suggestion = "<C-e>",
					next_suggestion = "<C-j>",
					previous_suggestion = "<C-k>",
				},
			})
		end,
	},
}
