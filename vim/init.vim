"
"   _____  _             _
"  |  __ \| |           (_)
"  | |__) | |_   _  __ _ _ _ __  ___
"  |  ___/| | | | |/ _` | | '_ \/ __|
"  | |    | | |_| | (_| | | | | \__ \
"  |_|    |_|\__,_|\__, |_|_| |_|___/
"                   __/ |
"                  |___/
"

set runtimepath+=$HOME/.config/vim/

call plug#begin('~/.config/vim/plugged')
        " Themes
        Plug 'gruvbox-community/gruvbox'
        Plug 'sainnhe/sonokai'

        " Visual
        Plug 'karb94/vim-smoothie'
        Plug 'junegunn/fzf.vim'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        "Plug 'nvim-lua/popup.nvim'
        "Plug 'nvim-lua/plenary.nvim'
        "Plug 'nvim-telescope/telescope.nvim'
        "Plug 'nvim-telescope/telescope-fzy-native.nvim'
        Plug 'preservim/nerdtree'
        Plug 'ntpeters/vim-better-whitespace'
        Plug 'airblade/vim-gitgutter'
        Plug 'airblade/vim-rooter'
        Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        Plug 'dense-analysis/ale'

        " Syntax
        Plug 'preservim/nerdcommenter'
        Plug 'sheerun/vim-polyglot'
        Plug 'junegunn/goyo.vim'
        Plug 'jiangmiao/auto-pairs'
        Plug 'editorconfig/editorconfig-vim'
        Plug 'godlygeek/tabular'
        Plug 'plasticboy/vim-markdown'
        Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

"
"    _____      _                     _
"   / ____|    | |                   | |
"  | |     ___ | | ___  _ __ ___  ___| |__   ___ _ __ ___   ___
"  | |    / _ \| |/ _ \| '__/ __|/ __| '_ \ / _ \ '_ ` _ \ / _ \
"  | |___| (_) | | (_) | |  \__ \ (__| | | |  __/ | | | | |  __/
"   \_____\___/|_|\___/|_|  |___/\___|_| |_|\___|_| |_| |_|\___|
"
"
"


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

"
"    _____             __ _                       _   _
"   / ____|           / _(_)                     | | (_)
"  | |     ___  _ __ | |_ _  __ _ _   _ _ __ __ _| |_ _  ___  _ __  ___
"  | |    / _ \| '_ \|  _| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \/ __|
"  | |___| (_) | | | | | | | (_| | |_| | | | (_| | |_| | (_) | | | \__ \
"   \_____\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|___/
"                            __/ |
"                           |___/
"

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
if &term =~ "^(screen|tmux)"
        execute "set <xUp>=\e[1;*A"
        execute "set <xDown>=\e[1;*B"
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
endif

" Enable Syntax Highlighting for RASI files
autocmd BufNewFile,BufRead /*.rasi setf css

"
"    _____ _        _             _ _
"   / ____| |      | |           | (_)
"  | (___ | |_ __ _| |_ _   _ ___| |_ _ __   ___
"   \___ \| __/ _` | __| | | / __| | | '_ \ / _ \
"   ____) | || (_| | |_| |_| \__ \ | | | | |  __/
"  |_____/ \__\__,_|\__|\__,_|___/_|_|_| |_|\___|
"
"
"

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

"
"   _   _ ______ _____  _____ _______               _____             __ _                       _   _
"  | \ | |  ____|  __ \|  __ \__   __|             / ____|           / _(_)                     | | (_)
"  |  \| | |__  | |__) | |  | | | |_ __ ___  ___  | |     ___  _ __ | |_ _  __ _ _   _ _ __ __ _| |_ _  ___  _ __
"  | . ` |  __| |  _  /| |  | | | | '__/ _ \/ _ \ | |    / _ \| '_ \|  _| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \
"  | |\  | |____| | \ \| |__| | | | | |  __/  __/ | |___| (_) | | | | | | | (_| | |_| | | | (_| | |_| | (_) | | | |
"  |_| \_|______|_|  \_\_____/  |_|_|  \___|\___|  \_____\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|
"                                                                           __/ |
"                                                                          |___/
"

" Open NERDTree when Vim/NeoVim starts
"autocmd VimEnter * NERDTree

" close nvim if the only window open is nerdtree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:nerdtree") && b:nerdtree.istabtree()) | q | endif

"
"         _                 _          _   _                            _     _ _                                    _____             __ _                       _   _
"        (_)               | |        | | | |                          | |   (_) |                                  / ____|           / _(_)                     | | (_)
"  __   ___ _ __ ___ ______| |__   ___| |_| |_ ___ _ __ ________      _| |__  _| |_ ___  ___ _ __   __ _  ___ ___  | |     ___  _ __ | |_ _  __ _ _   _ _ __ __ _| |_ _  ___  _ __
"  \ \ / / | '_ ` _ \______| '_ \ / _ \ __| __/ _ \ '__|______\ \ /\ / / '_ \| | __/ _ \/ __| '_ \ / _` |/ __/ _ \ | |    / _ \| '_ \|  _| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \
"   \ V /| | | | | | |     | |_) |  __/ |_| ||  __/ |          \ V  V /| | | | | ||  __/\__ \ |_) | (_| | (_|  __/ | |___| (_) | | | | | | | (_| | |_| | | | (_| | |_| | (_) | | | |
"    \_/ |_|_| |_| |_|     |_.__/ \___|\__|\__\___|_|           \_/\_/ |_| |_|_|\__\___||___/ .__/ \__,_|\___\___|  \_____\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|
"                                                                                           | |                                              __/ |
"                                                                                           |_|                                             |___/
"
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"
"    _____       _____    _____             __ _                       _   _
"   / ____|     / ____|  / ____|           / _(_)                     | | (_)
"  | |     ___ | |      | |     ___  _ __ | |_ _  __ _ _   _ _ __ __ _| |_ _  ___  _ __
"  | |    / _ \| |      | |    / _ \| '_ \|  _| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \
"  | |___| (_) | |____  | |___| (_) | | | | | | | (_| | |_| | | | (_| | |_| | (_) | | | |
"   \_____\___/ \_____|  \_____\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|
"                                                 __/ |
"                                                |___/
"

source $HOME/.config/vim/plug-config/coc.vim

" Disable autocompletion for RASI files
autocmd FileType rasi let b:coc_suggest_disable = 1

"
"    _____                      _____             __ _                       _   _
"   / ____|                    / ____|           / _(_)                     | | (_)
"  | |  __  ___  _   _  ___   | |     ___  _ __ | |_ _  __ _ _   _ _ __ __ _| |_ _  ___  _ __
"  | | |_ |/ _ \| | | |/ _ \  | |    / _ \| '_ \|  _| |/ _` | | | | '__/ _` | __| |/ _ \| '_ \
"  | |__| | (_) | |_| | (_) | | |___| (_) | | | | | | | (_| | |_| | | | (_| | |_| | (_) | | | |
"   \_____|\___/ \__, |\___/   \_____\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\__|_|\___/|_| |_|
"                 __/ |                                 __/ |
"                |___/                                 |___/
"

source $HOME/.config/vim/plug-config/goyo.vim

"
"   _  __          _     _           _ _
"  | |/ /         | |   (_)         | (_)
"  | ' / ___ _   _| |__  _ _ __   __| |_ _ __   __ _ ___
"  |  < / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|
"  | . \  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
"  |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
"             __/ |                             __/ |
"            |___/                             |___/
"

map <C-s> :w<CR>
map <ENTER> :Goyo<CR>
map <C-r> :source ~/.vimrc<CR>
map <C-q> :NERDTree<CR>

nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader>+ :vertical resize +2<CR>
nnoremap <leader>- :vertical resize -2<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>
