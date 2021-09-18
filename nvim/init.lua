-- Speedup startuptime
require("impatient")

-- Nvim configuration
require("plugins")
require("keymaps")
require("settings")
require("colorscheme")

-- Language Servers
require("plugin-configuration/nvim-lspinstall")

-- Load plugin configurations
require("plugin-configuration/nvim-cmp")
require("plugin-configuration/treesitter")
require("plugin-configuration/nvim-tree")
require("plugin-configuration/nvim-autopairs")
require("plugin-configuration/nvim-ts-autotag")
require("plugin-configuration/telescope")
require("plugin-configuration/nvim-comment")
require("plugin-configuration/barbar")
require("plugin-configuration/neoscroll")
require("plugin-configuration/gitsigns")
require("plugin-configuration/trouble")
