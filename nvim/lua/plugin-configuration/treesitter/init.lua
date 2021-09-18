-- Plugin integrations
local nvim_ts_context_commenstring_config = {
    enable = true,
    enable_autocmd = false,
}

local languages = {
    "lua",
    "javascript",
    "typescript",
    "c_sharp",
    "c",
    "cpp",
    "bash",
    "css",
    "vue",
    "comment",
    "jsdoc",
    "json",
    "html",
    "python",
    "yaml",
    "rust"
}

require "nvim-treesitter.configs".setup {
    ensure_installed = languages,
    highlight = { enable = true },
    context_commentstring = nvim_ts_context_commenstring_config,
}
