return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
				},
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = {
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<Up>"] = cmp.mapping.select_prev_item(),
					["<Down>"] = cmp.mapping.select_next_item(),
				},
				formatting = {
					format = function(entry, vim_item)
						local kind_icons = {
							Text = '"',
							Method = "Me",
							Function = "Fu",
							Constructor = "Co",
							Field = "f",
							Variable = "v",
							Class = "Cl",
							Interface = "If",
							Module = "Mo",
							Property = "f",
							Unit = "u",
							Value = "Va",
							Enum = "En",
							Keyword = "Ke",
							Snippet = "<>",
							Color = "Co",
							File = "Fi",
							Reference = "ref",
							Folder = "Di",
							EnumMember = "m",
							Constant = "c",
							Struct = "St",
							Event = "Ev",
							Operator = "op",
							TypeParameter = "Tp",
						}
						vim_item.kind = kind_icons[vim_item.kind]
						return vim_item
					end,
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
		config = function()
			local lsp_onattach = function(client, bufnr)
				local builtin = require("telescope.builtin")
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "gd", function()
					builtin.lsp_definitions({ layout_strategy = "vertical", width = 0.8 })
				end, opts)
				vim.keymap.set("n", "gi", function()
					builtin.lsp_implementations({ layout_strategy = "vertical", width = 0.8 })
				end, opts)
				vim.keymap.set("n", "gr", function()
					builtin.lsp_references({ layout_strategy = "vertical", width = 0.8 })
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
				ensure_installed = {
					"vtsls"
				},
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
				},
			})
		end,
	},
}
