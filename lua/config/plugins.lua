local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				auto_install = false,
				highlight = {
					enable = true,
				},
			})
		end,
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "BurntSushi/ripgrep" } },
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
					preview = {
						treesitter = false,
					},
					layout_configs = {
						vertical = { width = 0.5 },
					},
					file_ignore_patterns = { "node_modules", ".git", ".cache", ".angular", "dist" },
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})
			require("telescope").load_extension("fzf")

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
	})
	use({
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
				view = {
					adaptive_size = true,
				}
			})
			vim.keymap.set("n", "<leader>fe", ":NvimTreeFocus<CR>")
			vim.keymap.set("n", "<leader>fd", ":NvimTreeFindFile<CR>")
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "sonokai",
					sections = {
						lualine_a = { "mode" },
						lualine_b = { "branch" },
						lualine_c = { "filename" },
						lualine_x = { "encoding", "fileformat", "filetype" },
						lualine_y = { "progress" },
						lualine_z = { "location" },
					},
				},
			})
		end,
	})
	use({
		"williamboman/mason.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
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
			require("mason").setup()
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
				},
			})
		end,
	})
	use({
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
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = { 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip', 'hrsh7th/cmp-nvim-lsp' },
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
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"sainnhe/sonokai",
		config = function()
			vim.g.sonokai_style = "shusia"
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_enable_italic = 1

			vim.cmd([[colorscheme sonokai]])
		end,
	})
	use({
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	})

	-- use({
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({
	-- 			keymaps = {
	-- 				accept_suggestion = "<S-Tab>",
	-- 			},
	-- 		})
	-- 	end,
	-- })
	use({
		"github/copilot.vim",
		config = function()
			vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
			vim.g.copilot_no_tab_map = true
		end
	})

	use({
		"f-person/git-blame.nvim",
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup()
			vim.keymap.set('n', '[c', gitsigns.prev_hunk)
			vim.keymap.set('n', ']c', gitsigns.next_hunk)
		end,
	})
	use({
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>g", function()
				vim.cmd("LazyGit")
			end)
		end,
	})

	use({
		'romgrk/barbar.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
