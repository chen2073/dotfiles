return {
	"NeogitOrg/neogit",
	lazy = true,
	cond = not vim.g.vscode,
	dependencies = {
		"esmuellert/codediff.nvim",
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>g", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
}
