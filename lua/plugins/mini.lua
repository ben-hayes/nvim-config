local mini_config = function()
	require("mini.cursorword").setup({})
	require("mini.pairs").setup({})
	require("mini.splitjoin").setup({})
end
return { "echasnovski/mini.nvim", version = false, config = mini_config }
