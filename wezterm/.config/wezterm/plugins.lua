local wezterm = require("wezterm")
local gb = require("appearance").palette
local smart_splits = wezterm.plugin.require("https://github.com/smart-splits-nvim/backend-wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local sys = wezterm.plugin.require("https://github.com/usrivastava92/widgets.wez")

local M = {}

-- spacer drawn in the bar color, used as outer margin at both ends of the tab bar
local bar_bg = { Background = { Color = gb.bg0 } }
local bar_gap = { Text = " " }

-- thin divider between the system widgets; components already pad themselves by 1 on each side
local widget_sep = { Text = "│" }

-- tabline function components must return a plain string, so prefix the widget text ourselves
-- instead of using get_formatted (which returns colored format items)
local function with_icon(widget, icon)
	return function()
		return icon .. " " .. widget.get_text()
	end
end

-- smart-splits appends to config.keys, so apply this after keymaps
function M.apply_to_config(config)
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

	tabline.setup({
		options = {
			icons_enabled = true,
			theme = "GruvboxDark",
			tabs_enabled = true,
			theme_overrides = {
				normal_mode = {
					a = { fg = gb.bg0, bg = gb.fg4 },
					b = { fg = gb.fg2, bg = gb.bg1 },
					c = { fg = gb.fg4, bg = gb.bg0 },
					x = { fg = gb.fg4, bg = gb.bg0 },
					y = { fg = gb.fg2, bg = gb.bg1 },
					z = { fg = gb.bg0, bg = gb.fg4 },
				},
				copy_mode = {
					a = { fg = gb.bg0, bg = gb.yellow },
					b = { fg = gb.yellow, bg = gb.bg1 },
					c = { fg = gb.fg4, bg = gb.bg0 },
				},
				search_mode = {
					a = { fg = gb.bg0, bg = gb.aqua },
					b = { fg = gb.aqua, bg = gb.bg1 },
					c = { fg = gb.fg4, bg = gb.bg0 },
				},
				tab = {
					active = { fg = gb.yellow, bg = gb.bg1 },
					inactive = { fg = gb.bg4, bg = gb.bg0 },
					inactive_hover = { fg = gb.fg2, bg = gb.bg1 },
				},
			},
			-- rounded pill caps instead of hard powerline arrows
			section_separators = {
				left = wezterm.nerdfonts.ple_right_half_circle_thick,
				right = wezterm.nerdfonts.ple_left_half_circle_thick,
			},
			component_separators = { left = "", right = "" },
			tab_separators = {
				-- trailing space is drawn on the bar background, leaving a gap between tabs
				left = wezterm.nerdfonts.ple_right_half_circle_thick .. " ",
				right = wezterm.nerdfonts.ple_left_half_circle_thick,
			},
		},
		sections = {
			-- raw format tables pass straight through, so these give an outer margin in the bar color;
			-- "ResetAttributes" restores the section colors afterwards
			tabline_a = { bar_bg, bar_gap, "ResetAttributes", { "mode" } },
			tabline_b = { "workspace" },
			tabline_c = { "  " },
			tab_active = {
				"index",
				{ "process", padding = { left = 0, right = 1 } },
			},
			tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
			tabline_x = { { "datetime", style = "%Y/%m/%d %H:%M:%S" }, { Text = " " } },
			tabline_y = {
				with_icon(sys.cpu.utilization.widget(), wezterm.nerdfonts.md_cpu_64_bit),
				widget_sep,
				with_icon(sys.ram.utilization.widget(), wezterm.nerdfonts.md_memory),
				widget_sep,
				with_icon(sys.network.download.widget(), wezterm.nerdfonts.md_arrow_down),
				widget_sep,
				with_icon(sys.network.upload.widget(), wezterm.nerdfonts.md_arrow_up),
				{ Text = " " },
			},
			tabline_z = { { "domain", padding = { left = 1, right = 1 } }, bar_bg, bar_gap },
		},
		extensions = {},
	})
end

return M
