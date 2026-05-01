vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.timeoutlen = 2000

vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
	},
	pattern = {
		[".*compose.*%.ya?ml"] = "yaml.docker-compose",
	},
})

vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})

require("james.lazy")
require("james.lsp")
require("james.diag")
require("common")
require("keymaps")

-- right click menu customize
-- vim.cmd("aunmenu PopUp")

vim.cmd([[
  amenu PopUp.Copy\ abs\ Filepath <cmd>let @+ = expand('%:p')<cr>
  amenu PopUp.Go\ to\ Definition <cmd>lua vim.lsp.buf.definition()<CR>
]])

-- undotree
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "undotree" })

require("vim._core.ui2").enable({})
