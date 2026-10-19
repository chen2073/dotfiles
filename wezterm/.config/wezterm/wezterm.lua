local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("base").apply_to_config(config)
require("appearance").apply_to_config(config)
require("keymaps").apply_to_config(config)
-- after keymaps: smart-splits appends its bindings to config.keys
require("plugins").apply_to_config(config)

return config
