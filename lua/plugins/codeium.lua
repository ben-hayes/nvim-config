return {
	"Exafunction/codeium.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			-- enable_chat = true,
			enable_cmp_source = false,
			virtual_text = {
				filetypes = {
					tex = false,
          plaintex = false,
				},
				enabled = true,
				map_keys = true,
				idle_delay = 1,
				-- key_bindings = {
				-- 	accept = "<C-s>",
				-- },
			},
		})
	end,
}
