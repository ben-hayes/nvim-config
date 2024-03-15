local neotest_config = function()
  local neotest = require("neotest")
  local neotest_python = require("neotest-python")
  neotest.setup({
    adapters = {
      neotest_python({
        dap = { justMyCode = false },
      }),
    },
    quickfix = {
      open = true
    },
  })
end

return {
	{
		"nvim-neotest/neotest",
		dependencies = {
      "nvim-neotest/neotest-python",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
    config = neotest_config,
	},
}
