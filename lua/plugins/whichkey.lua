return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.setup({})

		wk.add({
			{ "<leader>f", group = "Telescope" },
			{ "<leader>d", group = "Debugger" },
			{ "<leader>s", group = "Sessions" },
			{ "<leader>u", group = "Rsync" },
			{ "<leader>D", group = "Diffview" },
			{ "<leader>;", group = "Neotest" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>v", group = "Vimtex" },
			{ "<leader>n", group = "Noice" },
			{ "<leader>r", group = "Refactor" },
			{ "<leader>b", group = "Buffer management" },
		})
	end,
}
