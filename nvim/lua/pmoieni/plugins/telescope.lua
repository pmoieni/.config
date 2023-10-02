return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				file_browser = {
					hijack_netrw = false,
					grouped = true,
					hidden = true,
					respect_gitignore = false
				},
			},
		})

		telescope.load_extension("file_browser")
	end
}
