return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- telescope 0.1.8's previewer calls the legacy `ft_to_lang`, which the
	-- nvim-treesitter `main` branch removed. Disable the treesitter-based
	-- preview highlighter; it falls back to Vim's regex syntax highlighting.
	opts = {
		defaults = {
			preview = {
				treesitter = false,
			},
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
		{ "<leader>fc", "<cmd>Telescope git_status<cr>", desc = "Telescope git status" },
	},
}
