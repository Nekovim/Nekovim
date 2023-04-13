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
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "9ac3e95" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "7470af8" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "8d3aa5c" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "729d83e" })
	use({ "kyazdani42/nvim-web-devicons", commit = "f16ec8f" })
	use({ "kyazdani42/nvim-tree.lua", commit = "920d5c8" })
	use({ "akinsho/bufferline.nvim", commit = "ef4fdc5" })
	use({ "moll/vim-bbye", commit = "25ef93a" })
	use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })
	use({ "akinsho/toggleterm.nvim", commit = "2e477f7" })
	use({ "ahmedkhalf/project.nvim", commit = "8c6bad7" })
	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "018bd04" })
	use({ "goolord/alpha-nvim", commit = "dafa11a" })
	use({ "folke/which-key.nvim", commit = "4b73390" })
	use({ "ggandor/leap.nvim" })

	-- QoL
	use({ "folke/twilight.nvim", commit = "2e13bd1" })
	use({ "Pocco81/true-zen.nvim", commit = "98740c7" })

	-- Language/File Specific
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "catppuccin/nvim" })
	use({ "rose-pine/neovim", as = "rose-pine" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", commit = "777450f" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "91ff86c" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "1809552" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "f349163" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "225ef9a" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "8d91ba2" }) -- a bunch of snippets to use

	-- LSP
	-- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
	use({ "neovim/nvim-lspconfig", commit = "10fa01d" }) -- enable LSP
	use({ "williamboman/mason.nvim", commit = "e5bb23f" })
	use({ "williamboman/mason-lspconfig.nvim", commit = "a8d5db8" })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", commit = "a290727" })
	use({ "simrat39/rust-tools.nvim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "6258d50" })
	use({ "nvim-telescope/telescope-file-browser.nvim", commit = "e0fcb12" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", commit = "a825012" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" })

	-- DAP
	use({ "mfussenegger/nvim-dap", commit = "6b12294a57001d994022df8acbe2ef7327d30587" })
	use({ "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" })
	use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
