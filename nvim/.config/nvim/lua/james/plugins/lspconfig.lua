return {
	"neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
	dependencies = { "saghen/blink.cmp" },
}
