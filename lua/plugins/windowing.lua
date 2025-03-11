return {
	{ "romgrk/barbar.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" } },
{
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			},
		})
	end,
}
}
