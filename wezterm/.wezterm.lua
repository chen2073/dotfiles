local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.color_scheme = "GruvboxDark"

config.window_background_opacity = 0.9
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800
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
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		-- clear the current command line: jump to end, then kill to start
		key = "u",
		mods = "LEADER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "e", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "u", mods = "CTRL" }),
		}),
	},
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = "Left" } },
		action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
		mods = "NONE",
	},
}

wezterm.on("window-config-reloaded", function(window, _)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
end)

return config
