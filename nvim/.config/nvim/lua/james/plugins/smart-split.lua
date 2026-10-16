return {
	"smart-splits-nvim/smart-splits.nvim",
	version = "^3.0.0",
	dependencies = {
		{
			"smart-splits-nvim/backend-wezterm",
			opts = {
				-- name/path of the wezterm binary; used only by :checkhealth's diagnostic version probe,
				-- never on any hot path (see "How it works")
				cli_path = "wezterm",
			},
		},
	},
	opts = {
		mux = {
			backend = "smart-splits-backend-wezterm",
		},
	},
	keys = {
		{
			"<A-h>",
			function()
				require("smart-splits").resize_left()
			end,
			desc = "Resize window left",
		},
		{
			"<A-j>",
			function()
				require("smart-splits").resize_down()
			end,
			desc = "Resize window down",
		},
		{
			"<A-k>",
			function()
				require("smart-splits").resize_up()
			end,
			desc = "Resize window up",
		},
		{
			"<A-l>",
			function()
				require("smart-splits").resize_right()
			end,
			desc = "Resize window right",
		},
		{
			"<C-h>",
			function()
				require("smart-splits").move_cursor_left()
			end,
			desc = "Move to left window",
		},
		{
			"<C-j>",
			function()
				require("smart-splits").move_cursor_down()
			end,
			desc = "Move to lower window",
		},
		{
			"<C-k>",
			function()
				require("smart-splits").move_cursor_up()
			end,
			desc = "Move to upper window",
		},
		{
			"<C-l>",
			function()
				require("smart-splits").move_cursor_right()
			end,
			desc = "Move to right window",
		},
		{
			"<A-w>l",
			"<cmd>vertical resize -2<CR>",
			desc = "Decrease window width",
		},
		{
			"<A-w>j",
			"<cmd>resize -2<CR>",
			desc = "Decrease window height",
		},
		{
			"<A-w>k",
			"<cmd>resize +2<CR>",
			desc = "Increase window height",
		},
		{
			"<A-w>h",
			"<cmd>vertical resize +2<CR>",
			desc = "Increase window width",
		},
	},
}
