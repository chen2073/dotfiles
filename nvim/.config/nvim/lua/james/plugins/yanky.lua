return {
	"gbprod/yanky.nvim",
	config = function()
		require("yanky").setup({
			ring = {
				permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
			},
			picker = {
				select = {
					action = require("yanky.picker").actions.set_register('"'),
				},
			},
			system_clipboard = {
				sync_with_ring = false,
			},
		})
		vim.keymap.set({ "n", "x" }, "<leader>p", "<cmd>YankyRingHistory<cr>", { desc = "Open Yank History" })
	end,
}
