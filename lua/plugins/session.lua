vim.opt.sessionoptions = "buffers,curdir,folds,tabpages,winpos,winsize"

return {
	{
		"olimorris/persisted.nvim",
		config = true,
		opts = {
			autosave = true,
			use_git_branch = true,
			telescope = {
				mappings = {
					copy_session = "<C-y>",
				},
			},
		},
		lazy = true,
		event = "BufReadPre",
	},
}
