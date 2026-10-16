local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/smart-splits-nvim/backend-wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true

config.initial_cols = 120
config.initial_rows = 28

-- config.window_decorations = "RESIZE"
-- config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "GruvboxDark"

config.window_background_opacity = 0.9
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800
-- config.window_close_confirmation = "AlwaysPrompt"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 14
config.default_domain = "WSL:Ubuntu"

config.wsl_domains = {
	{
		name = "WSL:Ubuntu",
		distribution = "Ubuntu",
		default_cwd = "~",
		default_prog = { "/home/linuxbrew/.linuxbrew/bin/fish", "-l" },
	},
}

config.underline_thickness = "200%" -- or a pixel value like 3 or '3px'
config.underline_position = "-2px" -- optional: nudge it down a bit

local claude_code = wezterm.action_callback(function(window, pane)
	local cwd = pane:get_current_working_dir()
	pane:split({
		direction = "Right",
		size = 0.5,
		cwd = cwd and cwd.file_path or nil,
		args = { "/home/linuxbrew/.linuxbrew/bin/fish", "-lc", "exec claude" },
	})
end)

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{
		key = "s",
		mods = "CTRL|SHIFT",
		action = wezterm.action.Search("CurrentSelectionOrEmptyString"),
	},
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "LeftArrow",
		mods = "LEADER",
		action = wezterm.action.Multiple({
			wezterm.action.SendKey({ key = "e", mods = "CTRL" }),
			wezterm.action.SendKey({ key = "u", mods = "CTRL" }),
		}),
	},
	{
		key = "c",
		mods = "LEADER",
		action = claude_code,
	},
	{
		key = "x",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "4",
		mods = "LEADER",
		action = wezterm.action_callback(function(_, pane)
			local right = pane:split({ direction = "Right" })
			pane:split({ direction = "Bottom" })
			right:split({ direction = "Bottom" })
		end),
	},
}

smart_splits.apply_to_config(config, {
	-- the default config is shown here; omit the table entirely to use it as-is

	-- directional keys, in order of: left, down, up, right
	direction_keys = { "h", "j", "k", "l" },
	-- move/resize can also be configured separately, e.g.:
	--   direction_keys = {
	--     move = { 'h', 'j', 'k', 'l' },
	--     resize = { 'LeftArrow', 'DownArrow', 'UpArrow', 'RightArrow' },
	--   },

	modifiers = {
		move = "CTRL", -- e.g. CTRL+h to move left
		resize = "META", -- e.g. META+h to resize left
	},

	-- what happens when there's no WezTerm pane in that direction: both a *direct* keypress in a
	-- pane not running Neovim, and a request from Neovim reporting it hit its own edge, resolve
	-- through this same option — smart-splits.nvim's own `move.at_edge` config has no effect here:
	--   'stop'  -- pass the keystroke through to the program in the pane (default)
	--   'wrap'  -- activate the farthest pane in the opposite direction
	--   'split' -- split the current pane in that direction
	--   function(ctx) ... end -- decide yourself; see below
	at_edge = "stop",

	-- block navigation (both a direct keypress and a request from Neovim) while the current pane
	-- is zoomed in
	block_nav_on_zoom = false,

	log_level = "info", -- 'error' | 'warn' | 'info'
})

config.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = "Left" } },
		action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
		mods = "NONE",
	},
}

return config
