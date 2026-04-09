return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({})

		vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#ff9e64" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#ff9e64" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#ff9e64" })
	end,
}
