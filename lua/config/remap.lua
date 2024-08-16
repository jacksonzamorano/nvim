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

-- Bind first 9 buffers
for i = 1, 9 do
	vim.api.nvim_set_keymap('n', '<A-' .. i .. '>', '<Cmd>BufferGoto ' .. i .. '<CR>', { noremap = true, silent = true })
end
vim.keymap.set('n', '<leader>w', function() vim.cmd('bd') end)
vim.keymap.set('n', '<leader>ph', function()
	vim.cmd('split')
	vim.cmd('wincmd l')
end)
vim.keymap.set('n', '<leader>pv', function()
	vim.cmd('vs')
	vim.cmd('wincmd l')
end)
vim.keymap.set('n', '<leader>pt', function ()
	vim.cmd('terminal')
end)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>');
vim.keymap.set('n', '<leader>pa', function() print(vim.fn.expand("%:p")) end)
vim.keymap.set('n', '<leader>pr', function() print(vim.fn.expand("%:f")) end)

vim.keymap.set('n', '<leader>?', function() vim.cmd('noh') end)

vim.keymap.set('n', '<leader>d', 'yyP')
vim.keymap.set('n', 'q', '<C-w>') 
vim.keymap.set('n', 'q,', '<C-w>20<')
vim.keymap.set('n', 'q.', '<C-w>20>')
vim.keymap.set('n', 'qo', ':%bd|e#|bd#<Cr>')

vim.keymap.set('v', '<A-/>', '<esc>/\\%V')

vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<cr>')

vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
