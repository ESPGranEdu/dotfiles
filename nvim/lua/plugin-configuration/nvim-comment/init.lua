require("nvim_comment").setup({
    comment_empty = true,
    line_mapping = "<Leader>cc",
    operator_mapping = "<Leader>c",
    hook = function()
        require("ts_context_commentstring.internal").update_commentstring()
    end
})

