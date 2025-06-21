vim.g.vimwiki_list = { { path = "~/Documents/Notes" } }
vim.o.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.lsp.config["rust-analyzer"] = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
}

vim.lsp.enable({
	"rust-analyzer",
})
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", {}),
	callback = function(args)
		local opts = { buffer = args.buf }
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		if client:supports_method("textDocument/rename") then
			vim.keymap.set("n", "mr", function()
				vim.lsp.buf.rename()
			end, opts)
		end
		vim.keymap.set("n", "mR", function()
			vim.lsp.stop_client(vim.lsp.get_clients())
			vim.cmd(":edit")
		end, opts)
		vim.keymap.set("n", "mh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opts)
		vim.keymap.set("i", "<CR>", function()
			vim.lsp.completion.get()
		end, opts)
		vim.keymap.set("n", "ma", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ float = true, count = -1 })
		end)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ float = true, count = 1 })
		end)
	end,
})
