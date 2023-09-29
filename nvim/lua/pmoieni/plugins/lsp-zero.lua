return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },         -- Required
        { 'hrsh7th/cmp-nvim-lsp' },     -- Required
        { 'hrsh7th/cmp-buffer' },       -- Optional
        { 'hrsh7th/cmp-path' },         -- Optional
        { 'saadparwaiz1/cmp_luasnip' }, -- Optional
        { 'hrsh7th/cmp-nvim-lua' },     -- Optional

        -- Snippets
        { 'L3MON4D3/LuaSnip' },             -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional

        -- Plugin dev
        { "folke/neodev.nvim" },
    },
    config = function()
        local neodev = require("neodev")
        local lsp = require("lsp-zero")

        neodev.setup()

        lsp.preset({
            name = 'minimal',
            set_lsp_keymaps = true,
            manage_nvim_cmp = true,
            suggest_lsp_servers = true,
        })

        lsp.nvim_workspace()

        lsp.on_attach(function(_, _)
            lsp.buffer_autoformat()
        end)

        lsp.configure('rust_analyzer', {
            -- enable clippy on save
            checkOnSave = {
                command = "clippy",
            },
        })

        lsp.set_sign_icons({
            error = '',
            warn = '',
            info = '',
            hint = '',
        })

        lsp.ensure_installed({
            'tsserver',
            'rust_analyzer',
            'gopls',
            'lua_ls',
        })

        lsp.setup()
    end
}
