local vimp = require("vimp")

require("trouble").setup({
    icons = true,
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_lsp_diagnostic_signs = false
})

vimp.nnoremap("<C-t>", ":TroubleToggle<CR>")
