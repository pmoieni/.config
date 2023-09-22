local status, conform = pcall(require, "conform")
if not status then
    return
end

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
    },
    format_after_save = {
        lsp_fallback = true,
    },
})
