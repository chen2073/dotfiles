return {
	"MeanderingProgrammer/render-markdown.nvim",
    cond = not vim.g.vscode,
	opts = {
		anti_conceal = { enabled = false },
		file_types = { "markdown", "opencode_output" },
	},
	ft = { "markdown", "codecompanion", "copilot-chat", "opencode_output" },
}
