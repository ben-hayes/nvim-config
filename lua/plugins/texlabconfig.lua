local config = {
	cache_activate = false,
	cache_filetypes = { "tex", "plaintex", "bib" },
	cache_root = vim.fn.stdpath("cache"),
	reverse_search_start_cmd = function()
		return true
	end,
	reverse_search_edit_cmd = vim.cmd.edit,
	reverse_search_end_cmd = function()
		return true
	end,
	file_permission_mode = 438,
}

-- Variable to track subfile mode state
local subfile_mode = false

-- Function to toggle TexLab build arguments between root and current file
function ToggleTexLabSubfileMode()
	subfile_mode = not subfile_mode

	vim.notify(
		"TexLab Subfile Mode",
		subfile_mode and "Subfile mode activated: compiling current file."
			or "Subfile mode deactivated: compiling root file.",
		"info"
	)
end

function BuildRespectingSubfileMode()
	local buf = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(buf)
	local filename = subfile_mode and filepath or "%f"

	local texlab_client = vim.lsp.get_clients({ name = "texlab" })[1]
	if texlab_client then
		local args = texlab_client.config.settings.texlab.build.args
		args[#args] = filename
		local notify =
			texlab_client.notify("workspace/didChangeConfiguration", { settings = texlab_client.config.settings })
		-- notify is boolean so we need to make it a string
	end
	vim.defer_fn(function()
		vim.cmd("TexlabBuild")
	end, 50)
end

function ForwardRespectingSubfileMode()
	local buf = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(buf)
	local filename = subfile_mode and filepath or "%f"

	local texlab_client = vim.lsp.get_clients({ name = "texlab" })[1]
	if texlab_client then
		-- Update forwardSearch PDF path
		local pdf_basename = vim.fn.fnamemodify(filename, ":t:r") .. ".pdf"
		local pdf_path = subfile_mode and ("out/" .. pdf_basename) or "%p"
		texlab_client.config.settings.texlab.forwardSearch.executable = "sioyek"
		texlab_client.config.settings.texlab.forwardSearch.args = {
			"--reuse-window",
			"--execute-command",
			"toggle_synctex",
			-- "--inverse-search",
			-- [[nvim-texlabconfig -file %%%1 -line %%%2 -server ]] .. vim.v.servername,
			"--forward-search-file",
			filename,
			"--forward-search-line",
			"%l",
			pdf_path,
		}

		texlab_client.notify("workspace/didChangeConfiguration", { settings = texlab_client.config.settings })
	end
	vim.defer_fn(function()
		vim.cmd("TexlabForward")
	end, 50)
end

-- Command to toggle subfile build mode
vim.api.nvim_create_user_command("ToggleSubfileMode", ToggleTexLabSubfileMode, {})

return {
	"f3fora/nvim-texlabconfig",
	config = function()
		require("texlabconfig").setup(config)
	end,
	ft = { "tex", "latex", "plaintex", "bib" }, -- Lazy-load on filetype
	build = "go build",
	-- build = 'go build -o ~/.bin/' -- if e.g. ~/.bin/ is in $PATH

	keys = {
		{ "<leader>lc", BuildRespectingSubfileMode, "n", desc = "Compile" },
		{ "<leader>ls", "<cmd>ToggleSubfileMode<cr>", "n", desc = "Toggle subfile mode" },
		{ "<leader>lf", ForwardRespectingSubfileMode, "n", desc = "TexLab Forward Search" },
		{ "<leader>lx", "<cmd>TexlabCancelBuild<cr>", "n", desc = "Cancel current build" },
		{ "<leader>lC", "<cmd>TexlabCleanAuxiliary<cr>", "n", desc = "Clean auxiliary files" },
		{ "<leader>le", "<cmd>TexlabChangeEnvironment<cr>", "n", desc = "Change environment" },
	},
}
