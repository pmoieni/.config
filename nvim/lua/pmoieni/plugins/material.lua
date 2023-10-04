return {
	"marko-cerovac/material.nvim",
	priority = 1000,
	config = function()
		require("material").setup({
			contrast = {
				floating_windows = true,
				cursor_line = true,
				sidebars = true,
			},
			lualine_style = "stealth",
		})

		vim.g.material_style = "palenight"
		vim.cmd([[colorscheme material]])

		local opts = { noremap = true, silent = true }

		local keymap = vim.keymap

		local mf = require("material.functions")

		opts.desc = "Toggle theme"
		keymap.set("n", "<leader>mm", mf.toggle_style, opts)

		opts.desc = "Find theme"
		keymap.set("n", "<leader>mf", mf.find_style, opts)
	end,
}
