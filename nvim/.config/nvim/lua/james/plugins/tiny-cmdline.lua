return {
	"rachartier/tiny-cmdline.nvim",
    cond = not vim.g.vscode,
	config = function()
		vim.o.cmdheight = 0
		require("tiny-cmdline").setup({
			on_reposition = require("tiny-cmdline").adapters.blink,
		})
	end,
}
