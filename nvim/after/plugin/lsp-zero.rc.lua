local status1, neodev = pcall(require, "neodev")
if not status1 then
    return
end

local status2, lsp = pcall(require, "lsp-zero")
if not status2 then
    return
end

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
