local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font('FiraCode Nerd Font')
config.font_size = 11.0

config.default_prog = { '/usr/bin/fish', '-l', '-c', 'tmux', 'new-session', '-A' }

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.enable_tab_bar = false

config.disable_default_key_bindings = true

return config
