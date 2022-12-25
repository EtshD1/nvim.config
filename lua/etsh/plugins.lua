local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Automatically run packer compile when saving this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
    -- Typescript
	use("jose-elias-alvarez/typescript.nvim")
    -- LSP utils
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    -- Icons
    use 'nvim-tree/nvim-web-devicons'
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Catppuccin Theme
	use { "catppuccin/nvim", as = "catppuccin" }
	-- Treesiter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
	-- Comment Manager
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- Neovim statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- Autocompletion Icons
    use {'onsails/lspkind.nvim'}
    -- Nvim Tree (File Explorer)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    -- Diagnostics
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    if packer_bootstrap then
		require('packer').sync()
	end
end)

