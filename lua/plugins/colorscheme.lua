return {
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({})
			vim.cmd.colorscheme("nord")
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "Verf/deepwhite.nvim", priority = 1000 },
	{ "nyoom-engineering/oxocarbon.nvim", priority = 1000 },
	{
		"uloco/bluloco.nvim",
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
      require("bluloco").setup({
        style = "light",
      })
		end,
	},
}
