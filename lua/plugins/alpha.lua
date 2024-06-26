local alpha_config = function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		[[  (be)nvim  ]],
	}
	dashboard.section.buttons.val = {
		dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("s", "󱈹  Open last session (dir x branch)", "<CMD>SessionLoad<CR>"),
    dashboard.button("S", "  Open session", ":Telescope persisted <CR>"),
		dashboard.button("r", "󰄉  Recently used files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
		dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
		dashboard.button("q", "󰅚  Quit Neovim", ":qa<CR>"),
	}

	local function footer()
		-- NOTE: requires the fortune-mod package to work
		-- local handle = io.popen("fortune")
		-- local fortune = handle:read("*a")
		-- handle:close()
		-- return fortune
		return "bh '23"
	end

	dashboard.section.footer.val = footer()

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true

	alpha.setup(dashboard.opts)
end

return {
	{
		"goolord/alpha-nvim",
		config = alpha_config,
	},
}
