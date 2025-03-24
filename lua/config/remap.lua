vim.g.mapleader = ' '
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- delay update diagnostics
    update_in_insert = true,
  }
)
-- Buffers
vim.api.nvim_set_keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-C>', '<Cmd>BufferClose!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'wi', function()
	vim.cmd('vs|wincmd l')
	require('telescope.builtin').find_files({layout_strategy = "vertical"})
end)
vim.keymap.set('n', 'wo', function()
	vim.cmd('split|wincmd j')
	require('telescope.builtin').find_files({layout_strategy = "vertical"})
end)
vim.keymap.set('n', 'wr', function()
	vim.cmd('wincmd =')
end)
vim.keymap.set('n', 'wl', '<C-W>L')
vim.keymap.set('n', 'wj', '<C-W>J')
vim.keymap.set('n', 'wk', '<C-W>K')
vim.keymap.set('n', 'wh', '<C-W>H')
vim.keymap.set('n', '`', function() vim.cmd('e #') end)
vim.keymap.set('n', '<leader>q', function() vim.cmd('bp|bd #') end)
vim.keymap.set('n', '<C-]>', '30<C-w>>')
vim.keymap.set('n', '<C-[>', '30<C-w><')
vim.keymap.set('n', '<C-n>', '10<C-w>+')
vim.keymap.set('n', '<C-m>', '10<C-w>-')
vim.keymap.set('n', '<C-z>', function() 
	vim.cmd('tab split')
end)
vim.keymap.set('n', '<C-x>', function()
	vim.cmd('tabc')
end)
vim.keymap.set('n', '<leader>pt', function ()
	vim.cmd('terminal')
end)
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h');
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j');
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k');
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l');
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>');
vim.keymap.set('n', '<C-q>', '<C-w><C-q>')
vim.keymap.set('n', '<leader>pa', function() print(vim.fn.expand("%:p")) end)
vim.keymap.set('n', '<leader>pr', function() print(vim.fn.expand("%:f")) end)

vim.keymap.set('n', '<leader>?', function() vim.cmd('noh') end)
vim.keymap.set('n', '<leader>d', 'yyP')
vim.keymap.set('v', '<A-/>', '<esc>/\\%V')

vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'

vim.keymap.set("n", "<leader>pw", function()
    vim.opt.wrap = not vim.opt.wrap:get()
    print("Wrap " .. (vim.opt.wrap:get() and "enabled" or "disabled"))
end, { noremap = true, silent = true, desc = "Toggle line wrapping" })
