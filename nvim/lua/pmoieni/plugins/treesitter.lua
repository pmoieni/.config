return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            highlight = {
                enable = true,
                disable = { "help" },
            },
            indent = {
                enable = true,
            },
            auto_install = true,
            autotag = {
                enable = true,
            },
        })

        local parsers = require("nvim-treesitter.parsers").get_parser_configs()

        parsers.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
    end
}
