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
