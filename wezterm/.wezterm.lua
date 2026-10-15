local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.color_scheme = "GruvboxDark"

config.window_background_opacity = 0.9
config.cursor_blink_rate = 500
config.window_close_confirmation = "AlwaysPrompt"
config.automatically_reload_config = true

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 14
config.default_domain = "WSL:Ubuntu"

config.wsl_domains = {
	{
		name = "WSL:Ubuntu",
		distribution = "Ubuntu",
		default_cwd = "~",
		default_prog = { "/home/linuxbrew/.linuxbrew/bin/tmux" },
	},
}

config.ssh_domains = {
	{
		name = "lin-jchen-01",
		remote_address = "10.50.4.134",
		username = "jchen",
		default_prog = { "/home/linuxbrew/.linuxbrew/bin/fish", "-l" },
		assume_shell = "Posix",
		ssh_option = {
			identityfile = "/home/jchen/.ssh/id_ed25519.pub",
		},
	},
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{
		key = "s",
		mods = "CTRL|SHIFT",
		action = wezterm.action.Search("CurrentSelectionOrEmptyString"),
	},
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.ReloadConfiguration,
	},
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = "Left" } },
		action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
		mods = "NONE",
	},
}

return config
