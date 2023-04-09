local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

local status_ok, neotest_python = pcall(require, "neotest-python")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		neotest_python({
			dap = { justMyCode = false },
		}),
	},
})

opts = { noremap = true, silent = true }
-- open magic test panel
vim.api.nvim_set_keymap(
  "n",
  "<leader>;;",
  "<cmd>lua require('neotest').summary.toggle()<CR>",
  opts
)

-- run current test
vim.api.nvim_set_keymap(
  "n",
  "<leader>;c",
  "<cmd>lua require('neotest').run.run()<CR>",
  opts
)

-- run last test
vim.api.nvim_set_keymap(
  "n",
  "<leader>;l",
  "<cmd>lua require('neotest').run.run_last()<CR>",
  opts
)

-- run current test file
vim.api.nvim_set_keymap(
  "n",
  "<leader>;f",
  "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  opts
)

-- debug nearest test
vim.api.nvim_set_keymap(
  "n",
  "<leader>;d",
  "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
  opts
)

