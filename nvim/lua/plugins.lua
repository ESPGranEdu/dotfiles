local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require("packer").startup(function()
	use "wbthomanson/packer.nvim"   	-- Packer can manage itself as an optional plugin
    use "nvim-lua/lsp-status.nvim"

    -- Caching
    use {'lewis6991/impatient.nvim', rocks = "mpack"}

    -- File Explorer
	use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" }

    -- Better hints
    use {"folke/trouble.nvim", requires = {
        "kyazdani42/nvim-web-devicons"
    }}

    -- Completion
    use "neovim/nvim-lspconfig"
    use "L3MON4D3/LuaSnip"
    use { "hrsh7th/nvim-cmp", requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim"
        }
    }
    use "windwp/nvim-ts-autotag"
    use "windwp/nvim-autopairs"
    use "ray-x/lsp_signature.nvim"

    -- Formatting
    use "lukas-reineke/format.nvim"

    -- Smooth Scroll
    use "karb94/neoscroll.nvim"

    -- Comments
    use "terrortylor/nvim-comment"
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Language Servers
    use "kabouzeid/nvim-lspinstall"

    -- Telescope (Fuzzy Finder)
    use { "nvim-telescope/telescope.nvim", requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim"
        }
    }
    use "nvim-telescope/telescope-media-files.nvim"

    -- Themes
    -- use "sainnhe/sonokai"
    -- use "EdenEast/nightfox.nvim"
    use "folke/tokyonight.nvim"

    -- TreeSitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/playground"

    -- Bar
    use "romgrk/barbar.nvim"

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- Better lua integration
    use {'svermeulen/vimpeccable'}

end)
