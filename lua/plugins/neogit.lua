local neogit_config = function()
	local neogit = require("neogit")
	neogit.setup({})
end
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		-- "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua",              -- optional
	},
	config = neogit_config,
	keys = {
		{ "<leader>G", "<cmd>Neogit<cr>", desc = "Open Neogit" },
		{
			"<leader>Do",
			"<cmd>DiffviewOpen<cr>",
			desc = "Open Diffview",
		},
		{
			"<leader>Dc",
			"<cmd>DiffviewClose<cr>",
			desc = "Close Diffview",
		},
	},
}
