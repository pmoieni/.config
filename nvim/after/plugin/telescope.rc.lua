local status, telescope = pcall(require, "telescope")
if not status then
    return
end

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
