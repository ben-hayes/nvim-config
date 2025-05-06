return {
	"folke/zen-mode.nvim",
	opts = {
		window = {
			options = {
				number = false,
				signcolumn = "no",
				foldcolumn = "0",
			},
		},
		plugins = {
			-- tmux = { enabled = true },
			-- twilight = { enabled = false },
			-- kitty = { enabled = true, font = "+3" },
		},
		cmd = { "ZenMode" },
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
	},
}
