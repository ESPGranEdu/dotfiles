local vimp = require("vimp")

-- Move between tabs
vimp.nnoremap({ "silent" }, "<A-,>" , ":BufferPrevious<CR>")
vimp.nnoremap({ "silent" }, "<A-.>", ":BufferNext<CR>")

-- Close buffer
vimp.nnoremap({ "silent" }, "<A-c>", ":BufferClose<CR>")

