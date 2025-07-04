return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "ts_ls" },
			automatic_installation = false,
			handlers = {
				-- Default handler (basic setup)
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				-- Custom handler for lua_ls
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = { globals = { "vim" } },
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,

				-- Custom handler for ts_ls
				["ts_ls"] = function()
					require("lspconfig").ts_ls.setup({
						settings = {
							typescript = {
								inlayHints = { includeInlayParameterNameHints = "all" },
							},
						},
					})
				end,
			},
		})
	end,
}
