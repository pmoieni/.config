local status_dap, dap = pcall(require, "dap")
if not status_dap then
    return
end

local status_go, go = pcall(require, "dap-go")
if not status_go then
    return
end

local status_ui, ui = pcall(require, "dapui")
if not status_ui then
    return
end

local status_vt, vt = pcall(require, "nvim-dap-virtual-text")
if not status_vt then
    return
end

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
