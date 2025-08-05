return {
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = false
			-- Load the colorscheme
			require("nord").set()
		end,
	},
	{
		"folke/tokyonight.nvim",
		cond = true, --don't uninstall the plugin when set to false
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			vim.cmd([[colorscheme tokyonight-storm]])
		end,
	},
}
