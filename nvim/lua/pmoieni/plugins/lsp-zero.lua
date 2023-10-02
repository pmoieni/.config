return {
    --[[{
        "folke/neodev.nvim",
        opts = {},
        config = true,
    },]]
    --
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
            vim.diagnostic.config({
                virtual_text = false,
                severity_sort = true,
                float = {
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "folke/neodev.nvim", opts = {} },
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lsp = require("lsp-zero")
            local lspconfig = require("lspconfig")

            lsp.set_sign_icons({
                error = "",
                warn = "",
                info = "",
                hint = "",
            })

            lsp.extend_lspconfig()

            lsp.on_attach(function(_, _)
                lsp.buffer_autoformat()
            end)

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "tsserver",
                    "rust_analyzer",
                    "gopls",
                    "lua_ls",
                },
                handlers = {
                    lsp.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp.nvim_lua_ls()
                        lspconfig.lua_ls.setup(lua_opts)
                    end,
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        config = function()
            local lsp = require("lsp-zero")
            local cmp = require("cmp")
            local cmp_action = lsp.cmp_action()

            lsp.extend_cmp()

            cmp.setup({
                formatting = lsp.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    -- `Enter` key to confirm completion
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),

                    -- Ctrl+Space to trigger completion menu
                    ["<C-Space>"] = cmp.mapping.complete(),

                    -- Navigate between snippet placeholder
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),

                    -- Scroll up and down in the completion documentation
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                }),
            })
        end,
    },
}
