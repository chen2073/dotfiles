return {
	"folke/which-key.nvim",
	event = "VeryLazy",
    cond = not vim.g.vscode,
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
		})
		wk.add({
			{ "<leader>l", group = "LSP", mode = "n" },
			{ "<leader>lj", group = "LSP jump", mode = "n" },
			{ "<leader>d", group = "diagnostics", mode = "n" },
			{ "<leader>h", group = "Gitsigns", mode = "n" },
			{ "<leader>f", group = "format", mode = { "n", "v" } },
			{ "<leader>m", group = "Recall Mark", mode = "n" },
			{ "<leader>t", group = "Grapple Tag", mode = "n" },
			{ "<leader>r", group = "Grugfar Replace", mode = { "n", "v" } },
			{ "<leader>rg", group = "Grugfar Replace in project", mode = { "n", "v" } },
			{ "<leader>s", group = "Fzf", mode = { "n", "v" } },
			{ "<leader>sr", group = "Fzf resume", mode = { "n", "v" } },
			{ "<leader>?", group = "help", mode = { "n", "v" } },
			{ "<leader>v", "<cmd>CodeDiff<cr>", desc = "Open CodeDiff", mode = "n" },
		})
	end,
}
