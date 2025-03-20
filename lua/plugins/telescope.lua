return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<leader>q"] = actions.close,
						["<c-q>"] = actions.close,
						["<c-d>"] = actions.delete_buffer,
					},
				},
				preview = { treesitter = false },
				layout_configs = { vertical = { width = 0.5 } },
				file_ignore_patterns = { "node_modules", ".git", ".cache", ".angular", "dist" },
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
		vim.keymap.set("n", "<leader>fa", function()
			builtin.find_files({ layout_strategy = "vertical" })
		end, {})
		vim.keymap.set("n", "\\", function()
			builtin.buffers({ layout_strategy = "vertical", sort_lastused = true })
		end, {})
		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({ layout_strategy = "vertical" })
		end, {})
		vim.keymap.set("n", "<leader>wr", function()
			builtin.lsp_dynamic_workspace_symbols({ layout_strategy = "vertical" })
		end, {})
	end,
}
