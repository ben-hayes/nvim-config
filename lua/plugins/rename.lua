return {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup()
	end,
	keys = { { "<leader>rn", ":IncRename " } },
}
