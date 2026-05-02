return {
	"Cannon07/code-preview.nvim",
	cond = not vim.g.vscode,
	config = function()
		require("code-preview").setup({
			neo_tree = {
				reveal = false, -- auto-reveal changed files in the tree
				position = "left", -- neo-tree window position: "left", "right", "float"
			},
		})
	end,
}
