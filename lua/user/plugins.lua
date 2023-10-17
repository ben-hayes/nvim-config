local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	use("windwp/nvim-autopairs") -- Auto pairs

	use("numToStr/Comment.nvim") -- Commenting plugin

	use("kyazdani42/nvim-web-devicons") -- Icons
	use("kyazdani42/nvim-tree.lua") -- File explorer

	-- Themes
	use("catppuccin/nvim") -- Color scheme
	use({
		"uloco/bluloco.nvim",
		requires = { "rktjmp/lush.nvim" },
	})
	use({
		-- "mcchrish/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		-- requires = "rktjmp/lush.nvim",
	})
  -- use "neanias/everforest-nvim"
  use "shaunsingh/nord.nvim"
	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Automatically set commentstring based on context
  use "nvim-treesitter/nvim-treesitter-context"

	-- GitHub Copilot
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup(require("user.copilot"))
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	-- Git
	use("lewis6991/gitsigns.nvim") -- Git signs

	-- Bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye") -- Close buffers without destroying my lovely layout

	-- toggleterm
	use("akinsho/toggleterm.nvim")

	-- impatient
	use("lewis6991/impatient.nvim") -- Speed up startup time

	-- lualine
	use("nvim-lualine/lualine.nvim")

	-- project.nvim
	use("ahmedkhalf/project.nvim")

	-- indent blankline
	use{"lukas-reineke/indent-blankline.nvim", tag = "v2.20.8"}

	-- alpha
	use("goolord/alpha-nvim")

	-- leap
	use("ggandor/leap.nvim")
	use("ggandor/flit.nvim")

  -- navigator
  use("numToStr/Navigator.nvim")

	-- jupyter
	--- jupytext
	use("goerz/jupytext.vim")
	--- iron.nvim
	use("Vigemus/iron.nvim")
	-- textobjects
	use("kana/vim-textobj-user")
	use("GCBallesteros/vim-textobj-hydrogen")

	-- testing
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	})
	use("nvim-neotest/neotest-python")

	-- whichkey
	use({
		"folke/which-key.nvim",
	})

  -- signatures
  use({
    "ray-x/lsp_signature.nvim",
  })

  -- fugitive
  use "tpope/vim-fugitive"

  --- osc52 allows remote copy paste
  use "ojroques/nvim-osc52"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
