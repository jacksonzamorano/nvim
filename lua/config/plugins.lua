local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
		config = function()
			require'nvim-treesitter.configs'.setup {
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true
				}
			}
		end,
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
    }
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' }, { 'BurntSushi/ripgrep' } },
		config = function()
			local actions = require('telescope.actions')
			local builtin = require('telescope.builtin')
			require('telescope').setup({
				defaults = {
					mappings = {
						i = {
							["<leader>q"] = actions.close,
							["<c-q>"] = actions.close,
							["<c-d>"] = actions.delete_buffer,
						}
					},
					preview = {
						treesitter = false
					},
					layout_configs = {
						vertical = { width = 0.5 }
					}
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = 'smart_case'
					}
				},
			})
			require('telescope').load_extension('fzf')

			vim.keymap.set('n', '<leader>fa', function() builtin.find_files({layout_strategy='vertical'}) end, {})
			vim.keymap.set('n', '<leader>b', function() builtin.buffers({layout_strategy='vertical'}) end, {})
			vim.keymap.set('n', '<leader>fg', function() builtin.live_grep({layout_strategy='vertical'}) end, {})
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require('lualine').setup({
				options = {
					icons_enabled = true,
					theme = 'sonokai',
					sections = {
						lualine_a = {'mode'},
						lualine_b = {'branch'},
						lualine_c = {'filename'},
						lualine_x = {'encoding', 'fileformat', 'filetype'},
						lualine_y = {'progress'},
						lualine_z = {'location'}
					}
				}
			})
		end
	}
	use {
		'williamboman/mason.nvim',
		requires = {
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
		},
		config = function()
			local lsp_onattach = function(client, bufnr)
				local builtin = require('telescope.builtin')
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set('n', '<leader>gi', function() vim.lsp.buf.references() end, opts)
				vim.keymap.set('n', '<leader>mr', function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set('n', '<leader>mh', function() vim.lsp.buf.signature_help() end, opts)
				vim.keymap.set('n', '<leader>md', function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set('n', '<leader>]d', function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set('n', '<leader>[d', function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set('n', '<leader>ma', function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set('n', '<leader>ff', function() vim.lsp.buf.format() end, opts)
				vim.keymap.set('v', '<leader>ff', function() vim.lsp.buf.format() end, opts)
				vim.keymap.set('n', '<leader>r', function() builtin.lsp_document_symbols({layout_strategy='vertical'}) end, {})
				vim.keymap.set('n', '<leader>wr', function() builtin.lsp_dynamic_workspace_symbols({layout_strategy='vertical'}) end, {})
			end

			local lspconfig = require('lspconfig')
			require('mason').setup()
			require('mason-lspconfig').setup {
				handlers = {
					function (server_name)
						lspconfig[server_name].setup {
							on_attach = lsp_onattach
						}
					end,
					['lua_ls'] = function()
						require'lspconfig'.lua_ls.setup {
							on_attach = lsp_onattach,
							on_init = function(client)
								client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
									runtime = {
										version = 'LuaJIT'
									},
									workspace = {
										checkThirdParty = false,
										library = {
											vim.env.VIMRUNTIME
										}
									}
								})
							end,
							settings = {
								Lua = {}
							}
						}
					end,
					['tsserver'] = function()
						require'lspconfig'.tsserver.setup {
							on_attach = lsp_onattach,
							settings = {
								typescript = {
									workspaceSymbols = {
										excludeLibrarySymbols = true
									}
								}
							}
						}
					end
				}
			}
		end
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip' },
		config = function()
			local cmp = require('cmp');
			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args)
					end
				},
				sources = {
					{ name = 'nvim_lsp' }
				},
				preselect = 'item',
				completion = {
					completeopt = 'menu,menuone,noinsert',
				},
				mapping = {
					['<Tab>'] = cmp.mapping.confirm({ select = true }),
					['<C-Space>'] = cmp.mapping.complete(),
					['<Up>'] = cmp.mapping.select_prev_item(),
					['<Down>'] = cmp.mapping.select_next_item(),
				},
				formatting = {
					format = function(entry, vim_item)
						local kind_icons = {
							Text = "",
							Method = "󰡱",
							Function = "󰊕",
							Constructor = "",
							Field = "=",
							Variable = "󰫧",
							Class = "󰠱",
							Interface = "",
							Module = "",
							Property = "󰜢",
							Unit = "",
							Value = "󰎠",
							Enum = "",
							Keyword = "󰌋",
							Snippet = "",
							Color = "󰏘",
							File = "󰈙",
							Reference = "",
							Folder = "󰉋",
							EnumMember = "",
							Constant = "󰏿",
							Struct = "",
							Event = "",
							Operator = "󰆕",
							TypeParameter = "󰅲",
						}
						vim_item.kind = kind_icons[vim_item.kind];
						return vim_item;
					end
				}
			});
		end
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = "make" }
	use {
		'romgrk/barbar.nvim',
		config = function()
			require('barbar').setup {
				animation = false,
				clickable = true,
				hide = {
					extensions = false,
					inactive = false
				},
				highlight_alternate = true,
				highlight_visible = true,
			}
		end
	}
	use {
		'sainnhe/sonokai',
		config = function()
			vim.g.sonokai_style = 'shusia'
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_enable_italic = 1

			vim.cmd[[colorscheme sonokai]]
		end
	}
	use {
		'mbbill/undotree',
		config = function()
			vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle);
		end
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
