return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				picker = "fzf",
			},
		})

		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
}
