local wezterm = require("wezterm")

local M = {}

-- gruvbox dark palette, so the tab bar sits on the same background as the terminal
M.palette = {
	bg0 = "#282828",
	bg1 = "#3c3836",
	bg2 = "#504945",
	bg4 = "#7c6f64",
	fg = "#ebdbb2",
	fg2 = "#d5c4a1",
	fg4 = "#a89984",
	yellow = "#fabd2f",
	aqua = "#8ec07c",
	red = "#fb4934",
}

function M.apply_to_config(config)
	config.initial_cols = 120
	config.initial_rows = 28

	config.color_scheme = "GruvboxDark"

	config.window_background_opacity = 0.9
	config.default_cursor_style = "BlinkingBlock"
	config.cursor_blink_rate = 800

	config.font = wezterm.font("JetBrainsMono Nerd Font")
	config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
	config.font_size = 14

	config.underline_thickness = "200%" -- or a pixel value like 3 or '3px'
	config.underline_position = "-2px" -- optional: nudge it down a bit

	-- flat (retro) tab bar painted with the terminal background instead of the native title-bar look
	config.hide_tab_bar_if_only_one_tab = false
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false
	config.tab_max_width = 32
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.colors = config.colors or {}
	config.colors.tab_bar = { background = M.palette.bg0 }

	-- the retro tab bar has no padding option; a top window border in the bar color sits above it
	-- and acts as a top margin
	config.window_frame = {
		border_top_height = "0.4cell",
		border_top_color = M.palette.bg0,
	}

	-- the retro tab bar draws integrated buttons as plain text (" . ", " - ", " X ") by default;
	-- use matching codicon glyphs instead, with a red hover on close like native Windows
	local function button(icon, fg, bg)
		return wezterm.format({
			{ Background = { Color = bg } },
			{ Foreground = { Color = fg } },
			{ Text = " " .. icon .. " " },
		})
	end
	local p = M.palette
	config.tab_bar_style = {
		window_hide = button(wezterm.nerdfonts.cod_chrome_minimize, p.fg4, p.bg0),
		window_hide_hover = button(wezterm.nerdfonts.cod_chrome_minimize, p.fg, p.bg1),
		window_maximize = button(wezterm.nerdfonts.cod_chrome_maximize, p.fg4, p.bg0),
		window_maximize_hover = button(wezterm.nerdfonts.cod_chrome_maximize, p.fg, p.bg1),
		window_close = button(wezterm.nerdfonts.cod_chrome_close, p.fg4, p.bg0),
		window_close_hover = button(wezterm.nerdfonts.cod_chrome_close, p.fg, p.red),
	}
end

return M
