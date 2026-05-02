return {
	"numToStr/Comment.nvim",
	cond = not vim.g.vscode,
	config = function()
		require("Comment").setup({})

		local comment = require("Comment.api")
		vim.keymap.set({ "n", "i" }, "<C-l>", function()
			comment.toggle.linewise.current()
		end, { desc = "toggle comment" })
	end,
}
