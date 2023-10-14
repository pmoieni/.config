return {
	"mfussenegger/nvim-dap",
	ft = {
		"go",
		"typescript",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
	},
	dependencies = {
		"leoluz/nvim-dap-go",
		"mxsdev/nvim-dap-vscode-js",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local go = require("dap-go")
		local js = require("dap-vscode-js")
		local ui = require("dapui")
		local vt = require("nvim-dap-virtual-text")

		go.setup()
		js.setup({
			debugger_path = vim.fn.stdpath('data') .. "/mason/js-debug-adapter", -- Path to vscode-js-debug installation.
			debugger_cmd = { "js-debug-adapter" },
			adapters = {
				'pwa-node',
				'pwa-chrome',
				'pwa-msedge',
				'node-terminal',
				'pwa-extensionHost',
				'node',
				'chrome',
			}, -- which adapters to register in nvim-dap
		})
		ui.setup()
		vt.setup({})

		local js_based_languages = {
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
		}

		for _, language in ipairs(js_based_languages) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require 'dap.utils'.pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-chrome",
					request = "launch",
					name = "Start Chrome with \"localhost\"",
					url = "http://localhost:3000",
					webRoot = "${workspaceFolder}",
					userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
				}
			}
		end

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
