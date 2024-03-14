return {
	-- My plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- ful lua functions d ny lots of plugins
	"moll/vim-bbye", -- Close buffers without destroying my lovely layout
	-- whichkey
	{
		"folke/which-key.nvim",
	},


	-- fugitive
	"tpope/vim-fugitive",

	{
		"folke/trouble.nvim",
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{
		"coffebar/transfer.nvim",
		lazy = true,
		cmd = {
			"TransferInit",
			"DiffRemote",
			"TransferUpload",
			"TransferDownload",
			"TransferDirDiff",
			"TransferRepeat",
		},
		opts = {},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				options = {
					number = false,
					signcolumn = "no",
				},
			},
			plugins = {
				tmux = { enabled = true },
				twilight = { enabled = false },
				kitty = { enabled = true, font = "+4" },
			},
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
