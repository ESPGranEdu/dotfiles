"==== Plugins ============================================================================
call plug#begin('~/.vim/plugged')
        " Themes
        Plug 'gruvbox-community/gruvbox'
        Plug 'sainnhe/sonokai'

        " Visual
        Plug 'karb94/vim-smoothie'
        Plug 'junegunn/fzf.vim'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'preservim/nerdtree'
        Plug 'ntpeters/vim-better-whitespace'
        Plug 'airblade/vim-gitgutter'
        Plug 'airblade/vim-rooter'
        Plug 'dense-analysis/ale'

        "Syntax
        Plug 'preservim/nerdcommenter'
        Plug 'sheerun/vim-polyglot'
        Plug 'junegunn/goyo.vim'
        Plug 'jiangmiao/auto-pairs'
        Plug 'editorconfig/editorconfig-vim'
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'
        Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

"==== Config Colorscheme =================================================================
set termguicolors
syntax enable
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
colorscheme sonokai
set background=dark
highlight Normal  ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Some times 'termguicolors' is not enough to enable true colors so we need to
" set this variables
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"==== Configurations  ======================================================================
set encoding=UTF-8
syntax on                    " Syntax highlight
set nocompatible             " Be Improved
filetype plugin on           " Required (nerdcommenter)
set number                   " Line Number
set spelllang=es             " Spell lang for spellcheck
set noswapfile               " Dont create a swap file
set mouse=r                  " Allow copy and paste with mouse
set clipboard=unnamedplus    " Use system clipboard
set relativenumber           " Relative line number
set smartindent              " Indentation
set colorcolumn=120          " Display vertical ruler
set tabstop=4                " Tab Spacing
set softtabstop=4            " Tab Spacing
set expandtab                " Convert Tabs to Spaces
set cursorline               " Visual cursorline
set wildmenu                 " Visual autocomplete in statusline
set showcmd                  " Show partial command in statusline
set nowrap                   " Disable line wrapping
let g:netrw_banner=0         " Disable netrw baner
let mapleader=' '            " Set leader key to space
set guicursor=               " Disable changing cursor shape outside Vim/NeoVim

" Tmux willl send xterm-keys when it's xterm-keys option is on
if &term =~ "^screen"
        execute "set <xUp>=\e[1;*A"
        execute "set <xDown>=\e[1;*B"
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
endif
"==== Statusline ==========================================================================
set laststatus=2
set noshowmode
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           			" buffer number
set statusline+=%#Visual#       			" colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     			" colour
set statusline+=%R                        	" readonly flag
set statusline+=%m                        	" modified [+] flag
set statusline+=%#Cursor#               	" colour
set statusline+=%#CursorLine#     			" colour
set statusline+=\ %t\                   	" short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   			" colour
set statusline+=\ %y\                   	" file type
set statusline+=%#CursorIM#     			" colouystemd-altctl-1.4.4181-1-any.pkg.tar.xz
set statusline+=\ %l:%c/%L\ lines\         	" line + column
set statusline+=%#Cursor#       			" colour
set statusline+=\ %3p%%\                	" percentage

"==== NERDTree Configuration ===============================================================
" Open NERDTree when Vim/NeoVim starts
"autocmd VimEnter * NERDTree

" close nvim if the only window open is nerdtree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:nerdtree") && b:nerdtree.istabtree()) | q | endif

"==== vim-better-whitespace Configuration ==================================================
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"==== CoC configuration ====================================================================
source $HOME/.vim/plug-config/coc.vim

"==== Goyo connfiguration ==================================================================
source $HOME/.vim/plug-config/goyo.vim

"==== Keybindings ==========================================================================
map <C-s> :w<CR>
map <ENTER> :Goyo<CR>
map <C-r> :source ~/.vimrc<CR>
map <C-n> :NERDTree<CR>

nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader>+ :vertical resize +2<CR>
nnoremap <leader>- :vertical resize -2<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>
