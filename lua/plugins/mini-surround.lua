return {
	"echsnovski/mini.surround",
	version = "*",
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "sa",
				delete = "sd",
				replace = "sr",
			},
		})
	end,
}
