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
        vt.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            ui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            ui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            ui.close()
        end
    end,
}
