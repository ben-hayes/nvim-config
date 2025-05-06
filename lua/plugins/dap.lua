return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		init = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

			require("dap.ext.vscode").load_launchjs(nil, {})
		end,
		keys = {
			{ "<leader>d", group = "Debugger" },
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Launch debug session / continue",
			},
			{
				"<leader>dn",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
			},
			{
				"<leader>do",
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<leader>ds",
				function()
					require("dap").step_into()
				end,
				desc = "Step into",
			},
			{
				"<leader>dt",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle debugger UI",
			},
			{
				"<leader>dw",
				function()
					require("dap").repl.open()
				end,
				desc = "Open REPL",
			},
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		init = function()
			require("dap-python").setup()
		end,
	},
}
