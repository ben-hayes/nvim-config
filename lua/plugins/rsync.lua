return {
	"OscarCreator/rsync.nvim",
	build = "make",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("rsync").setup({
			sync_on_save = false,
		})
	end,
	keys = {
		{ "<leader>u", group = "Upload / Download" },
		{ "<leader>uu", "<cmd>RsyncUpFile<cr>", desc = "Upload file to remote server" },
		{ "<leader>uU", "<cmd>RsyncUp<cr>", desc = "Upload directory to remote server" },
		{ "<leader>ud", "<cmd>RsyncDownFile<cr>", desc = "Download file from remote server" },
		{ "<leader>uD", "<cmd>RsyncDown<cr>", desc = "Download directory from remote server" },
		{ "<leader>ul", "<cmd>RsyncLog<cr>", desc = "Open rsync.nvim log file" },
		{ "<leader>uc", "<cmd>RsyncConfig<cr>", desc = "Open rsync.nvim user config" },
		{ "<leader>up", "<cmd>RsyncProjectConfig<cr>", desc = "Open rsync.nvim project config" },
		{ "<leader>uS", "<cmd>RsyncSaveSync toggle<cr>", desc = "Toggle sync on saving" },
	},
}
