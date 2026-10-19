local wezterm = require("wezterm")

local M = {}

local claude_code = wezterm.action_callback(function(window, pane)
	local cwd = pane:get_current_working_dir()
	pane:split({
		direction = "Right",
		size = 0.5,
		cwd = cwd and cwd.file_path or nil,
		args = { "/home/linuxbrew/.linuxbrew/bin/fish", "-lc", "exec claude" },
	})
end)

function M.apply_to_config(config)
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

	config.mouse_bindings = {
		{
			event = { Down = { streak = 3, button = "Left" } },
			action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
			mods = "NONE",
		},
	}
end

return M
