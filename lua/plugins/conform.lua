return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				go = { "gofmt" },
				svelte = { "prettier" },
				astro = { "prettier" },
				python = { "black" },
				html = { "prettier" },
				css = { "prettier" },
			},
		})
		require("conform").formatters.prettier = {
			prepend_args = {
				"--tab-width=4",
			},
		}
		vim.keymap.set("n", "<leader>.", function()
			require("conform").format()
		end)
		vim.keymap.set("v", "<leader>.", function()
			require("conform").format()
		end)
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				go = { "gofmt" },
				svelte = { "prettier" },
				astro = { "prettier" },
				python = { "black" },
				html = { "prettier" },
				css = { "prettier" },
			},
		})
		require("conform").formatters.prettier = {
			prepend_args = {
				"--tab-width=4",
			},
		}
		vim.keymap.set("n", "<leader>.", function()
			require("conform").format()
		end)
		vim.keymap.set("v", "<leader>.", function()
			require("conform").format()
		end)
	end,
}
