local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- -- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup lazy_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | Lazy sync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
return lazy.setup({
	-- My plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- ful lua functions d ny lots of plugins

	"windwp/nvim-autopairs", -- Auto pairs

	"numToStr/Comment.nvim", -- Commenting plugin

	"kyazdani42/nvim-web-devicons", -- Icons
	"kyazdani42/nvim-tree.lua", -- File explorer

	"shaunsingh/nord.nvim",
	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim", -- simple to  language server installer
	"williamboman/mason-lspconfig.nvim", -- simple to  language server installer
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions

	-- Telescope
	"nvim-telescope/telescope.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"HiPhish/rainbow-delimiters.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring", -- Automatically set commentstring based on context
	"nvim-treesitter/nvim-treesitter-context",

	-- GitHub Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		lazy = true,
		config = function()
			require("copilot").setup({})
		end,
	},
	-- ({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },

	-- Git
	"lewis6991/gitsigns.nvim", -- Git signs

	-- Bufferline
	"akinsho/bufferline.nvim",
	"moll/vim-bbye", -- Close buffers without destroying my lovely layout

	-- impatient
	"lewis6991/impatient.nvim", -- Speed up startup time

	-- lualine
	"nvim-lualine/lualine.nvim",

	-- project.nvim
	"ahmedkhalf/project.nvim",

	-- indent blankline
	{ "lukas-reineke/indent-blankline.nvim", version = "v2.20.8" },

	-- alpha
	"goolord/alpha-nvim",

	-- leap
	"tpope/vim-repeat",
	"ggandor/leap.nvim",
	"ggandor/flit.nvim",

	-- navigator
	"numToStr/Navigator.nvim",

	-- -- jupyter
	-- --- jupytext
	-- ("goerz/jupytext.vim",
	-- --- iron.nvim
	"Vigemus/iron.nvim",
	-- -- textobjects
	-- ("kana/vim-textobj-r",
	-- ("GCBallesteros/vim-textobj-hydrogen",

	-- testing
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},
	"nvim-neotest/neotest-python",

	-- whichkey
	{
		"folke/which-key.nvim",
	},

	-- signatures
	-- {
	--   "ray-x/lsp_signature.nvim",
	-- },

	-- fugitive
	"tpope/vim-fugitive",

	{
		"folke/trouble.nvim",
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{
		"coffebar/transfer.nvim",
		lazy = true,
		cmd = {
			"TransferInit",
			"DiffRemote",
			"TransferUpload",
			"TransferDownload",
			"TransferDirDiff",
			"TransferRepeat",
		},
		opts = {},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
	},
})
