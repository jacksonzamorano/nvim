return {
	{ "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip", "hrsh7th/cmp-nvim-lsp" } },
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
		config = function()
			local lsp_onattach = function(client, bufnr)
				local builtin = require("telescope.builtin")
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "gi", function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set("n", "mr", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("n", "mh", function()
					vim.lsp.buf.signature_help()
				end, opts)
				vim.keymap.set("n", "md", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("n", "ma", function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set("n", "<leader>r", function()
					builtin.lsp_document_symbols({ layout_strategy = "vertical" })
				end, {})
			end

			local lspconfig = require("lspconfig")
			require("mason").setup({})
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							on_attach = lsp_onattach,
						})
					end,
					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							on_attach = lsp_onattach,
							on_init = function(client)
								client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
									runtime = {
										version = "LuaJIT",
									},
									workspace = {
										checkThirdParty = false,
										library = {
											vim.env.VIMRUNTIME,
										},
									},
								})
							end,
							settings = {
								Lua = {},
							},
						})
					end,
					["angularls"] = function()
						local angularls_path = vim.fn.exepath("ngserver")
						local cmd = {
							angularls_path,
							"--stdio",
							"--tsProbeLocations",
							table.concat({
								angularls_path,
								vim.uv.cwd(),
							}, ","),
							"--ngProbeLocations",
							table.concat({
								angularls_path .. "/node_modules/@angular/language-server",
								vim.uv.cwd(),
							}, ","),
						}

						lspconfig.angularls.setup({
							on_attach = lsp_onattach,
							cmd = cmd,
							on_new_config = function(new_config, _)
								new_config.cmd = cmd
							end,
						})
					end,
					["ts_ls"] = function()
						lspconfig.ts_ls.setup({
							on_attach = lsp_onattach,
							settings = {
								typescript = {
									workspaceSymbols = {
										excludeLibrarySymbols = true,
									},
								},
							},
						})
					end,
				}
			})
		end,
	},
}
