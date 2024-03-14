local blankline_config = function()
	local indent_blankline = require("indent_blankline")
	indent_blankline.setup({
		show_current_context = true,
		show_current_context_start = true,
	})
end

return {
	{ "lukas-reineke/indent-blankline.nvim", version = "v2.20.8", config = blankline_config },
}
