return {
	"RRethy/vim-illuminate",
	cond = not vim.g.vscode,
	config = function()
		require("illuminate").configure({
			filetypes_denylist = {
				"dirbuf",
				"dirvish",
				"NeogitStatus",
			},
		})

			vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#fabd2f" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#fabd2f" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#fabd2f" })
	end,
}
