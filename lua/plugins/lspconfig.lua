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

		-- Lua Language Server
		vim.lsp.config('lua_ls', {
			cmd = { 'lua-language-server' },
			root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', '.git' },
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		vim.lsp.enable('lua_ls')

		-- Python (Pyright)
		vim.lsp.config('pyright', {
			cmd = { 'pyright-langserver', '--stdio' },
			root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
		})
		vim.lsp.enable('pyright')

		-- TypeScript/JavaScript
		vim.lsp.config('ts_ls', {
			cmd = { 'typescript-language-server', '--stdio' },
			root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
		})
		vim.lsp.enable('ts_ls')

		-- C/C++ (Clangd)
		vim.lsp.config('clangd', {
			cmd = { 'clangd' },
			root_markers = { 'compile_commands.json', 'compile_flags.txt', '.clangd', '.git' },
		})
		vim.lsp.enable('clangd')

		-- Go
		vim.lsp.config('gopls', {
			cmd = { 'gopls' },
			root_markers = { 'go.mod', 'go.work', '.git' },
		})
		vim.lsp.enable('gopls')

		-- Templ
		vim.lsp.config('templ', {
			cmd = { 'templ', 'lsp' },
			root_markers = { 'go.mod', '.git' },
		})
		vim.lsp.enable('templ')
	end,
}
