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
	end,
}
