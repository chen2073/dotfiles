return {
	"esmuellert/codediff.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	cond = not vim.g.vscode,
	cmd = "CodeDiff",
	opts = {
		keymaps = {
			view = {
				next_hunk = "]h", -- Jump to next change
				prev_hunk = "[h", -- Jump to previous change
				toggle_stage = "<leader>s", -- Stage/unstage current file (works in explorer and diff buffers)
			},
			conflict = {
				next_conflict = "]c", -- Jump to next conflict
				prev_conflict = "[c", -- Jump to previous conflict
			},
		},
	},
	keys = {
		{
			"<leader>v",
			mode = { "n" },
			function()
				vim.cmd("CodeDiff")
			end,
			desc = "CodeDiff",
		},
	},
}
