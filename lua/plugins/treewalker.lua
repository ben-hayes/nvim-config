return {
	"aaronik/treewalker.nvim",

	-- The following options are the defaults.
	-- Treewalker aims for sane defaults, so these are each individually optional,
	-- and setup() does not need to be called, so the whole opts block is optional as well.
	opts = {
		-- Whether to briefly highlight the node after jumping to it
		highlight = true,

		-- How long should above highlight last (in ms)
		highlight_duration = 250,

		-- The color of the above highlight. Must be a valid vim highlight group.
		-- (see :h highlight-group for options)
		highlight_group = "CursorLine",
	},
  keys = {
    { "<M-k>", "<cmd>Treewalker Up<cr>zz", {"n", "v"}, silent = true},
    { "<M-j>", "<cmd>Treewalker Down<cr>zz", {"n", "v"}, silent = true},
    { "<M-h>", "<cmd>Treewalker Left<cr>zz", {"n", "v"}, silent = true},
    { "<M-l>", "<cmd>Treewalker Right<cr>zz", {"n", "v"}, silent = true},
    { "<M-S-k>", "<cmd>Treewalker SwapUp<cr>", {"n"}, silent = true},
    { "<M-S-j>", "<cmd>Treewalker SwapDown<cr>", {"n"}, silent = true},
    { "<M-S-h>", "<cmd>Treewalker SwapLeft<cr>", {"n"}, silent = true},
    { "<M-S-l>", "<cmd>Treewalker SwapRight<cr>", {"n"}, silent = true},
  },
}
