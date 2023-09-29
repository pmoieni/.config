return {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
        vim.o.background = "dark"
        vim.g.gruvbox_material_better_performance = 1
        vim.cmd('colorscheme gruvbox-material')
    end
}
