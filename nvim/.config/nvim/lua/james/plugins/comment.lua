return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({})

		local comment = require("Comment.api")
		vim.keymap.set({ "n", "i" }, "<C-l>", function()
			comment.toggle.linewise.current()
		end, { desc = "toggle comment" })

		vim.keymap.set({ "n", "v" }, "<leader>cu", function()
			comment.uncomment.linewise()
		end, { desc = "uncomment current line" })

		vim.keymap.set({ "n", "v" }, "<leader>cc", function()
			comment.comment.linewise()
		end, { desc = "comment current line" })
	end,
}
