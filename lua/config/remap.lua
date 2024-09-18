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
vim.keymap.set('n', '`', function() vim.cmd('e #') end)
vim.keymap.set('n', '<leader>w', function() vim.cmd('bp|bd #') end)
vim.keymap.set('n', '<leader>ph', function()
	vim.cmd('20split')
	vim.cmd('wincmd l')
end)
vim.keymap.set('n', '<leader>pv', function()
	vim.cmd('20vs')
	vim.cmd('wincmd l')
end)
vim.keymap.set('n', '<leader>pt', function ()
	vim.cmd('terminal')
end)
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>');
vim.keymap.set('n', '<leader>pa', function() print(vim.fn.expand("%:p")) end)
vim.keymap.set('n', '<leader>pr', function() print(vim.fn.expand("%:f")) end)

vim.keymap.set('n', '<leader>?', function() vim.cmd('noh') end)

vim.keymap.set('n', '<leader>d', 'yyP')

vim.keymap.set('v', '<A-/>', '<esc>/\\%V')

vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<cr>')

vim.keymap.set('n', '<leader>fn', function()
	local fname = vim.fn.expand('%:h')
	vim.ui.input({ prompt = '[New]: '..fname..'/' }, function (filename)
		if filename then
			vim.cmd('e %:h/'..filename)
		end
	end);
end);
vim.keymap.set('n', '<leader>fr', function()
	local orig_name = vim.fn.expand('%:t');
	local fname = vim.fn.expand('%:h')
	vim.ui.input({ prompt = '[Rename]: ('..orig_name..') '..fname..'/' }, function (filename)
		if filename then
			local orig = vim.api.nvim_buf_get_name(0);
			vim.cmd('saveas %:h/'..filename);
			vim.cmd('!rm '..orig);
		end
	end);
end);
vim.keymap.set('n', '<leader>fd', function()
	local fname = vim.fn.expand('%');
	vim.ui.input({ prompt = '[Delete]: '..fname..' (y/N) > '}, function (confirm)
		if confirm == 'y' then
			vim.cmd('call delete(expand(\'%\')) | bdelete!')
		end
	end);
end);

vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'yes'
