local oil_config = function()
	local oil = require("oil")
	oil.setup({
		columns = {
			"icon",
		},
		delete_to_trash = true,
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<leader>v"] = "actions.select_vsplit",
			["<leader>s"] = "actions.select_split",
			["<leader>t"] = "actions.select_tab",
			["<leader>p"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<leader>r"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
    use_default_keymaps = false,
	})
end

return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	config = oil_config,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
