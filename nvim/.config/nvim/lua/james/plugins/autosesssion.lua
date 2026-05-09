return {
	"rmagatti/auto-session",
	cond = not vim.g.vscode,
	lazy = false,
	config = function()
		require("auto-session").setup({
			git_use_branch_name = true,
			git_auto_restore_on_branch_change = true,
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				picker = "fzf",
			},
		})

		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		vim.keymap.set("n", "<leader>a", "<cmd>AutoSession search<CR>", { desc = "auto session search" })
	end,
}
