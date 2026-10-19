local wezterm = require("wezterm")

local M = {}

M.is_windows = wezterm.target_triple:find("windows") ~= nil
M.is_macos = wezterm.target_triple:find("darwin") ~= nil

local function apply_macos(config)
	config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
end

local function apply_windows(config)
	config.wsl_domains = {
		{
			name = "WSL:Ubuntu",
			distribution = "Ubuntu",
			default_cwd = "~",
			default_prog = { "/home/linuxbrew/.linuxbrew/bin/fish", "-l" },
		},
	}
	config.default_domain = "WSL:Ubuntu"
end

function M.apply_to_config(config)
	config.automatically_reload_config = true
	config.window_close_confirmation = "AlwaysPrompt"

	if M.is_macos then
		apply_macos(config)
	elseif M.is_windows then
		apply_windows(config)
	end
end

return M
