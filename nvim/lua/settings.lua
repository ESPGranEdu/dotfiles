-- Configurations inspired from
-- https://github.com/LunarVim/LunarVim/blob/c9a5ddf161bfd9fddda037bd54453f8bcd7d0c18/lua/settings.lua#L18

-- Disable comments when insert a new line when the line before were commented
vim.api.nvim_exec([[
  augroup echo_formatoptions
    autocmd!
    autocmd BufEnter * set formatoptions-=cro
  augroup END
]], false)
vim.api.nvim_exec([[ set shortmess+=c ]], false)
vim.o.hidden = true                                               -- Required to keep multiple buffers open multiple buffers
vim.wo.wrap = false                                               -- Display long lines as just one line
vim.o.completeopt = "menuone,noselect,noinsert,menu"              -- Completion menu configuration
vim.o.encoding = "utf-8"                                          -- The encoding displayed
vim.o.pumheight = 10                                              -- Makes popup menu smaller
vim.o.fileencoding ="utf-8"                                       -- The encoding written to file
vim.o.ruler = true                                                -- Show the cursor position all the time
vim.o.cmdheight = 2                                               -- More space for displaying messages
vim.o.mouse ="a"                                                  -- Enable your mouse
vim.o.splitbelow = true                                           -- Horizontal splits will automatically be below
vim.o.splitright = true                                           -- Vertical splits will automatically be to the right
vim.o.conceallevel = 0                                            -- So that I can see `` in markdown files
vim.o.tabstop = 4                                                 -- Insert 4 spaces for a tab
vim.o.shiftwidth = 4                                              -- Change the number of space characters inserted for indentation
vim.o.smarttab = true                                             -- Makes tabbing smarter will realize you have 2 vs 4
vim.o.expandtab = true                                            -- Converts tabs to spaces
vim.o.smartindent = true                                          -- Makes indenting smart
vim.o.autoindent = true                                           -- Good auto indent
vim.wo.number = true                                              -- Display line numbers
vim.o.relativenumber = true                                       -- Relative line numbers
vim.bo.formatoptions = "crqj"
vim.o.cursorline = true                                           -- Enable highlighting of the current line
vim.o.showmode = false                                            -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false                                              -- This is recommended by coc
vim.o.writebackup = false                                         -- This is recommended by coc
vim.wo.signcolumn = "yes"                                         -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300                                            -- Faster completion
vim.o.clipboard = "unnamedplus"                                   -- Copy paste between vim and everything else
vim.o.incsearch = true
vim.o.guicursor = ""
