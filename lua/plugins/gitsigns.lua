local gitsigns_config = function()
	local gitsigns = require("gitsigns")
  gitsigns.setup()
end

return {
	{
		"lewis6991/gitsigns.nvim",
		config = gitsigns_config,
	},
}
