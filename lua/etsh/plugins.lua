-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

-- Automatically source and re-compile packer whenever you save this init.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer_status, packer = pcall(require, "packer")

if not packer_status then
	print("packer is not found")
	return
end

packer.init({
	-- ensure_dependencies   = true, -- Should packer install plugin dependencies?
	-- plugin_package = 'packer', -- The default package for plugins
	-- auto_clean = true, -- During sync(), remove unused plugins
	-- compile_on_sync = true, -- During sync(), run packer.compile()
	-- disable_commands = false, -- Disable creating commands
	-- preview_updates = true, -- If true, always preview updates before choosing which plugins to update, same as `PackerUpdate --preview`.
	-- display = {
	--   non_interactive = true, -- If true, disable display windows for all operations
	--   compact = false, -- If true, fold updates results by default
	--   working_sym = '⟳', -- The symbol for a plugin being installed/updated
	--   error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
	--   done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
	--   removed_sym = '-', -- The symbol for an unused plugin which was removed
	--   moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
	--   header_sym = '━', -- The symbol for the header line in packer's display
	--   show_all_info = true, -- Should packer show all update details automatically?
	--   prompt_border = 'double', -- Border style of prompt popups.
	--   keybindings = { -- Keybindings for the display window
	--     quit = 'q',
	--     toggle_update = 'u', -- only in preview
	--     continue = 'c', -- only in preview
	--     toggle_info = '<CR>',
	--     diff = 'd',
	--     prompt_revert = 'r',
	--   }
	-- },
	-- autoremove = false, -- Remove disabled or unused plugins without prompting the user
})

packer.startup(function(use)
	-- LspSaga
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	-- Package manager
	use("wbthomason/packer.nvim")

	use({
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	})
	-- File Browser
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	use({
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"ray-x/cmp-treesitter",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"honza/vim-snippets",
		},
	})

	use({
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})

	use({
		-- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	-- Git related plugins
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("lewis6991/gitsigns.nvim")

	-- For formatting
	use("jose-elias-alvarez/null-ls.nvim")

	use({ "catppuccin/nvim", as = "catppuccin" })
	use("nvim-lualine/lualine.nvim") -- Fancier statusline
	use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })

	-- Diagnostics List
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, "custom.plugins")
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require("packer").sync()
	end
end)

if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end
