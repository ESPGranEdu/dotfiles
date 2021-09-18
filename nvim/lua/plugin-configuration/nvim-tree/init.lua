local view = require("nvim-tree.view")
local vimp = require("vimp")

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_highllight_opened_files = 1
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}

vimp.nnoremap("<C-n>", function()
    if not view.win_open() then
        require("nvim-tree").find_file(true)
        require("bufferline.state").set_offset(31, "FileExplorer")
    else
        require("bufferline.state").set_offset(0)
        require("nvim-tree").close()
    end
end)
