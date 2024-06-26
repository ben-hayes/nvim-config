telescope_config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local trouble = require("trouble.providers.telescope")

	telescope.load_extension("projects")
	telescope.load_extension("persisted")

	telescope.setup({
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "smart" },

			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,

					["<C-c>"] = actions.close,

					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,

					["<CR>"] = actions.select_default,
					["<C-x>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,

					--[[ ["<C-u>"] = actions.preview_scrolling_up, ]]
					--[[ ["<C-d>"] = actions.preview_scrolling_down, ]]
					["<C-d>"] = actions.delete_buffer,

					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,

					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					["<C-l>"] = actions.complete_tag,
					["<C-_>"] = actions.which_key, -- keys from pressing <C-/>

					["<C-o>"] = require("trouble.sources.telescope").open,
				},
				n = {
					["<esc>"] = actions.close,
					["<CR>"] = actions.select_default,
					["<C-x>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
					["<C-t>"] = actions.select_tab,

					["<C-c>"] = actions.close,

					["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
					["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
					["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["H"] = actions.move_to_top,
					["M"] = actions.move_to_middle,
					["L"] = actions.move_to_bottom,

					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["gg"] = actions.move_to_top,
					["G"] = actions.move_to_bottom,

					--[[ ["<C-u>"] = actions.preview_scrolling_up, ]]
					--[[ ["<C-d>"] = actions.preview_scrolling_down, ]]
					["<C-d>"] = actions.delete_buffer,

					["<PageUp>"] = actions.results_scrolling_up,
					["<PageDown>"] = actions.results_scrolling_down,

					["?"] = actions.which_key,

					["<C-o>"] = require("trouble.sources.telescope").open,
				},
			},
		},
		extensions = {
			persisted = {
				layout_config = { width = 0.55, height = 0.55 },
			},
		},
	})
end

return {
	{
		"nvim-telescope/telescope.nvim",
		config = telescope_config,
		cmd = { "Telescope" },
	},
}
