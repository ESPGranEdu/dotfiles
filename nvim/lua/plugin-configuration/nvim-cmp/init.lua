local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

-- Helper functions
local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local termcodes = function (str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Setup
cmp.setup {
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ["<TAB>"] = cmp.mapping(function(callback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(termcodes("<CR>"), "")
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(termcodes("<Plug>luasnip-expand-or-jump"), "")
            elseif check_back_space() then
                vim.fn.feedkeys(termcodes("<tab>"), "n")
            else
                callback()
            end
        end,
        { "i", "s" }),
        ["<S-TAB>"] = cmp.mapping(function(callback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(termcodes("<C-p>"), "n")
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(termcodes("<Plug>luasnip-jump-prev"), "")
            else
              callback()
            end
        end, { "i", "s"}),
    },
    completion = {
        completeopt = "menu,menuone,noinsert"
    },
    snippet = {
       expand = function(args)
           require("luasnip").lsp_expand(args.body)
       end
    },
    formatting = {
        format = function(_, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
            return vim_item
        end
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "nvim_lua"},
        {name = "luansnip"},
        {name = "buffer"},
        {name = "path"},
    }
}
