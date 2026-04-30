return {
	"RRethy/vim-illuminate",
    cond = not vim.g.vscode,
	config = function()
		require("illuminate").configure({})

		vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#c4a082" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#c4a082" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#c4a082" })
	end,
}
