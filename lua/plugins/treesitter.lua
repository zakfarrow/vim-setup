return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- the main branch does not support lazy-loading
	build = ":TSUpdate",
	config = function()
		-- Install parsers (async; a no-op if already installed).
		-- The `:TSUpdate` build step keeps them in sync with the plugin.
		require("nvim-treesitter").install({
			"lua",
			"python",
			"javascript",
			"typescript",
			"html",
			"css",
			"templ",
			"go",
			"vimdoc",
			"dockerfile",
		})

		-- The main branch removed the `highlight`/`indent` modules; you now
		-- enable Neovim's built-in treesitter features yourself.
		local group = vim.api.nvim_create_augroup("treesitter_setup", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			callback = function(ev)
				-- Highlighting: errors for filetypes without an installed
				-- parser, so guard with pcall and only turn on treesitter
				-- indentation when highlighting actually started.
				if pcall(vim.treesitter.start, ev.buf) then
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
