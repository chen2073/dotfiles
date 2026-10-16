vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.foldenable = false
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.scrolloff = 7

-- cursor shape + blinking (Neovim must request blink itself; Ghostty's
-- cursor-style-blink is ignored once an app drives the cursor via guicursor)
vim.o.guicursor = table.concat({
	"n-v-c:block-blinkwait1000-blinkon500-blinkoff500",
	"i-ci:ver25-blinkwait1000-blinkon500-blinkoff500",
	"r:hor50-blinkwait100-blinkon500-blinkoff500",
}, ",")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		-- highlight on yank for vscode
		vim.highlight.on_yank({ timeout = 600 })

		-- copy to system clipboard
		local event = vim.v.event
		if event.operator == "y" and event.regname == "" then
			vim.fn.setreg("+", event.regcontents, event.regtype)
		end
	end,
})
