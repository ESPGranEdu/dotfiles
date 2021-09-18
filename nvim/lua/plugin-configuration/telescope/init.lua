local actions = require("telescope.actions")
local vimp = require("vimp")
require("telescope").setup {
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >> ",
        color_devicons = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

require("telescope").load_extension("fzy_native")

-- https://stackoverflow.com/a/40195356
-- Check if a file or directory exists in this path
local function exists(file)
   local ok, _err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok
end

--- Check if a directory exists in this path
local function isdir(path)
   -- "/" works on both Unix and Windows
   return exists(path.."/")
end

-- Telescope keymaps
vimp.nnoremap("<Leader>p", function()
    if isdir(vim.fn.getcwd() .. "/.git") then
        require("telescope.builtin").git_files()
    else
        require("telescope.builtin").find_files()
    end
end)
vimp.nnoremap("<Leader>f", "<cmd>lua require('telescope.builtin').live_grep()<CR>")

