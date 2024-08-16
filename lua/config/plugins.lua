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

local lsp_onattach = function()
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
end


local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' }, { 'BurntSushi/ripgrep' } },
		config = function()
			local builtin = require('telescope.builtin')
			local actions = require('telescope.actions')

			require('telescope').setup({
				defaults = {
					mappings = {
						i = {
							["<leader>q"] = actions.close,
							["<c-q>"] = actions.close,
							["<c-d>"] = actions.delete_buffer,
						}
					}
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = 'smart_case'
					}
				}
			})
			require('telescope').load_extension('fzf')
			local ivy = require('telescope.themes').get_ivy();

			vim.keymap.set('n', '<leader>fa', function() builtin.find_files(ivy) end, {})
			vim.keymap.set('n', '<leader>fb', function() builtin.buffers(ivy) end, {})
			vim.keymap.set('n', '<leader>r', builtin.lsp_document_symbols, {})
			vim.keymap.set('n', '<leader>fr', builtin.lsp_dynamic_workspace_symbols, {})
			vim.keymap.set('n', '<leader>fg', function() builtin.live_grep(ivy) end, {})
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "javascript", "typescript", "json" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			}
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
			local lspconfig = require('lspconfig')
			require('mason').setup()
			require('mason-lspconfig').setup {
				handlers = {
					function (server_name)
						lspconfig[server_name].setup {
							on_attach = lsp_onattach
						}
					end,
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
				},
			});
		end
	}
	use {
		'f-person/git-blame.nvim',
		config = function()
			require('gitsigns').setup{
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					vim.keymap.set('n', '[c', function() gs.prev_hunk() end)
					vim.keymap.set('n', ']c', function() gs.next_hunk() end)
				end
			}
		end
	}
	use 'lewis6991/gitsigns.nvim'
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = "make" }
	use 'https://tpope.io/vim/commentary.git'
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
		'nvim-tree/nvim-tree.lua',
		config = function()
			require('nvim-tree').setup({
				view = {
					width = 50,
				},
				on_attach = function (bufnr)
					local api = require('nvim-tree.api')

					-- Bind [ to collapse and ] to expand
					vim.keymap.set('n', '[', api.tree.collapse_all, { noremap = true, silent = true, buffer = bufnr })
					vim.keymap.set('n', ']', api.tree.expand_all, { noremap = true, silent = true, buffer = bufnr  })
					vim.keymap.set('n', 'a', api.fs.create, { noremap = true, silent = true, buffer = bufnr  })
					vim.keymap.set('n', 'd', api.fs.remove, { noremap = true, silent = true, buffer = bufnr  })
					vim.keymap.set('n', 'r', api.fs.rename, { noremap = true, silent = true, buffer = bufnr  })

					-- Open file on enter
					vim.keymap.set('n', '<CR>', api.node.open.edit, { noremap = true, silent = true, buffer = bufnr  })
					vim.keymap.set('n', 'op', api.node.open.horizontal, { noremap = true, silent = true, buffer = bufnr })
					vim.keymap.set('n', 'ov', api.node.open.vertical, { noremap = true, silent = true, buffer = bufnr })
				end
			})
			vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>');
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
