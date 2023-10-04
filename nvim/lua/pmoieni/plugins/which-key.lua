local opts = {
	mode = "n",
	prefix = "",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
}

local mf = require("material.functions")

return {
	"folke/which-key.nvim",
	config = function()
		local wc = require("which-key")

		wc.register({
			["d"] = {
				name = "Word",
				w = { 'vb"_d', "delete a word backwards" },
			},
			["t"] = {
				name = "Tab",
				e = { "<Cmd>tabedit<CR>", "new tab" },
			},
			["s"] = {
				name = "Window",
			},
			["<leader>"] = {
				name = "Editor",
				mm = { mf.toggle_style, "toggle theme" },
				mf = { mf.find_style, "find theme" },
				e = { "<Cmd>Telescope file_browser<CR>", "browse files" },
				f = { "<Cmd>Telescope find_files<CR>", "find files" },
				lg = { "<Cmd>Telescope live_grep<CR>", "live grep" },
				gs = { "<Cmd>Telescope git_stash<CR>", "git stash" },
				gb = { "<Cmd>Telescope git_branches<CR>", "git branches" },
				gc = { "<Cmd>Telescope git_commits<CR>", "git commits" },
				h = { "<Cmd>Telescope help_tags<CR>", "help tags" },
				d = { vim.diagnostic.open_float, "diagnostics float" },
				D = { "<Cmd>Telescope diagnostics<CR>", "show diagnostics" },
				b = { "<Cmd>DapToggleBreakpoint<CR>", "debugger toggle breakpoint" },
				B = {
					"<Cmd>:lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
					"debugger conditianally toggle breakpoint",
				},
				["\\"] = { "<Cmd>Telescope buffers<CR>", "switch buffers" },
				["<leader>"] = { "<Cmd>Telescope resume<CR>", "resume" },
			},
			K = { vim.lsp.buf.hover, "lsp hover" },
			gd = { vim.lsp.buf.definition, "lsp definition" },
			gD = { vim.lsp.buf.declaration, "lsp declaration" },
			gi = { vim.lsp.buf.implementation, "lsp implementation" },
			gr = { vim.lsp.buf.references, "lsp references" },
			gs = { vim.lsp.buf.signature_help, "lsp signature help" },
			["<F2>"] = { vim.lsp.buf.rename, "lsp rename" },
			["<F3>"] = { "<Cmd>lua vim.lsp.buf.format({async = true})<CR>", "lsp format" },
			["<F4>"] = { vim.lsp.buf.code_action, "lsp code action" },
			["<F5>"] = { "<Cmd>DapContinue<CR>", "continue debugging" },
			["<F10>"] = { "<Cmd>DapStepOver<CR>", "debugger step over" },
			["<F11>"] = { "<Cmd>DapStepInto<CR>", "debugger step into" },
			["<F12>"] = { "<Cmd>DapStepOut<CR>", "debugger step out" },
		}, opts)

		wc.setup()
	end,
}
