return {
    "nvim-telescope/telescope.nvim",
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    grouped = true,
                    hidden = true,
                    respect_gitignore = false
                },
            },
        })

        telescope.load_extension("file_browser")
    end
}
