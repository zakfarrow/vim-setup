return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"clangd",
				"gopls",
				"templ",
			},
		})

		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.pyright.setup({})
		lspconfig.ts_ls.setup({})
		lspconfig.clangd.setup({})
		lspconfig.gopls.setup({})
		lspconfig.templ.setup({})
	end,
}
