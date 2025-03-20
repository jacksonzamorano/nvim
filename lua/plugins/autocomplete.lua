return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			model = "claude-3.7-sonnet",
			mappings = {
				submit_prompt = {
					normal = '<Leader>s',
					insert = '<C-s>',
				},
				reset = {
					normal = '<Leader>r',
					insert = '<C-r>',
				},
			},
		},
		keys = {
			{ "<leader>a", "<cmd>CopilotChat<cr>", { noremap = true, silent = true } },
			{ "<leader>ac", "<cmd>CopilotChat<cr>", { noremap = true, silent = true } },
		},
		setup = function()
		end,
		-- See Commands section for default commands if you want to lazy load on them
	},
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({
	-- 			keymaps = {
	-- 				accept_suggestion = "<S-Tab>",
	-- 				clear_suggestion = "<C-e>",
	-- 				next_suggestion = "<C-j>",
	-- 				previous_suggestion = "<C-k>",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
