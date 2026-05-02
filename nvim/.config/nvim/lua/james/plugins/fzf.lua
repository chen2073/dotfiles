return {
	"ibhagwan/fzf-lua",
	cond = not vim.g.vscode,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			files = {
				rg_opts = "--color=never --files --hidden --follow " .. "-g '!.git' -g '!node_modules' -g '!.cargo'",
				fd_opts = "--color=never --type f --hidden --follow "
					.. "--exclude .git --exclude node_modules --exclude .cargo",
			},
			grep = {
				rg_opts = "--column --line-number --no-heading --color=always --smart-case "
					.. "--max-columns=4096 "
					.. "-g '!.git/' -g '!node_modules/' -g '!.cargo/'",
				hidden = true,
			},
			previewers = {
				builtin = {
					title_fnamemodify = function(s)
						return vim.fn.fnamemodify(s, ":p")
					end,
				},
			},
		})

		fzf.register_ui_select()

		-- buffers and tabs
		vim.keymap.set({ "n" }, "<leader>sb", function()
			fzf.buffers()
		end, { desc = "buffers" })
		vim.keymap.set({ "n" }, "<leader>st", function()
			fzf.tabs()
		end, { desc = "search tabs" })

		-- files
		vim.keymap.set({ "n" }, "<leader>sf", function()
			fzf.files()
		end, { desc = "files" })
		vim.keymap.set({ "n" }, "<leader>srf", function()
			fzf.files({ resume = true })
		end, { desc = "resume files" })

		-- grep current buffer
		vim.keymap.set("n", "<leader>sg", function()
			fzf.grep_curbuf()
		end, { desc = "grep current buffer" })
		vim.keymap.set("n", "<leader>srg", function()
			fzf.grep_curbuf({ resume = true })
		end, { desc = "resume grep current buffer" })

		-- grep cword and cWORD
		vim.keymap.set("n", "<leader>sw", function()
			fzf.grep_cword()
		end, { desc = "search word under cursor" })
		vim.keymap.set("n", "<leader>sW", function()
			fzf.grep_cWORD({ resume = true })
		end, { desc = "search WORD under cursor" })

		-- grep project
		vim.keymap.set("n", "<leader>sp", function()
			fzf.grep_project()
		end, { desc = "grep project" })

		vim.keymap.set("n", "<leader>srp", function()
			fzf.grep_project({ resume = true })
		end, { desc = "resume grep project" })

		-- grep visual
		vim.keymap.set("v", "<leader>sg", function()
			fzf.grep_visual()
		end, { desc = "grep visual selection" })

		vim.keymap.set({ "n", "v" }, "<C-f>", ":FzfLua ", { desc = ":Fzf" })

		vim.keymap.set({ "n", "v" }, "<leader>sk", function()
			fzf.keymaps({ winopts = { preview = { hidden = true } } })
		end, { desc = "search keymaps" })

		vim.keymap.set({ "n", "v" }, "<leader>sc", function()
			fzf.commands({ winopts = { preview = { hidden = true } } })
		end, { desc = "search commands" })

		vim.keymap.set("n", "<leader>lr", function()
			fzf.lsp_references({ jump1 = false })
		end, { desc = "Show LSP Reference" })

		vim.keymap.set("n", "<leader>ld", function()
			fzf.lsp_definitions({ jump1 = false })
		end, { desc = "Show LSP Definition" })

		vim.keymap.set("n", "<leader>lc", function()
			fzf.lsp_declarations({ jump1 = false })
		end, { desc = "Show LSP Declaration" })

		vim.keymap.set("n", "<leader>lt", function()
			fzf.lsp_typedefs({ jump1 = false })
		end, { desc = "Show LSP Typedef" })

		vim.keymap.set("n", "<leader>li", function()
			fzf.lsp_implementations({ jump1 = false })
		end, { desc = "Show LSP Implementation" })

		vim.keymap.set("n", "<leader>dd", function()
			fzf.diagnostics_document()
		end, { desc = "Show document diagnostics" })

		vim.keymap.set("n", "<leader>dw", function()
			fzf.diagnostics_workspace()
		end, { desc = "Show workspace diagnostics" })
	end,
}
