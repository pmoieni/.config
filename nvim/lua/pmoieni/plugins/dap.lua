return {
	"mfussenegger/nvim-dap",
	ft = { "go" },
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local go = require("dap-go")
		local ui = require("dapui")
		local vt = require("nvim-dap-virtual-text")

		go.setup()
		ui.setup()
		vt.setup({})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			ui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			ui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			ui.close()
		end

		local opts = { noremap = true, silent = true }

		local keymap = vim.keymap

		opts.desc = "Debugger toggle breakpoint"
		keymap.set("n", "<leader>dtb", "<cmd>DapToggleBreakpoint<CR>", opts)

		opts.desc = "Debugger conditianally toggle breakpoint"
		keymap.set("n", "<leader>dtB",
			"<cmd>:lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)

		opts.desc = "Continue debugging"
		keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", opts)

		opts.desc = "Debugger step over"
		keymap.set("n", "<leader>dso", "<cmd>DapStepOver<CR>", opts)

		opts.desc = "Debugger step into"
		keymap.set("n", "<leader>dsi", "<cmd>DapStepInto<CR>", opts)

		opts.desc = "Debugger step out"
		keymap.set("n", "<leader>dso", "<cmd>DapStepOut<CR>", opts)
	end,
}
