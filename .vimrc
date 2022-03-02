" install vim-plug if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'

Plug 'machakann/vim-highlightedyank'

Plug 'preservim/nerdtree'

" color themes
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'

call plug#end()

" nerd tree settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" vim-better-whitespace settings
let g:better_whitespace_ctermcolor='blue'
" set to 0 to disable
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Highlighted yank settings
" if Vim version < 8.0
if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
endif
" set highlight duration
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highightedyank_highlight_duration = 300

" Color theme settings
if (has('termguicolors'))
    set termguicolors
endif
colorscheme onedark

" User interface
set laststatus=2
set ruler
set wildmenu
set number
"set relativenumber
set noerrorbells
set mouse=a
set title
set background=dark

" Reading settings
set nowrap
syntax enable
set encoding=utf-8
set list
" show start of tabs as '>' and rest of tab as '-'
set listchars=tab:>.

" Indentation
set autoindent
set expandtab
filetype plugin indent on
set noshiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" Cursor settings
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" Search settings
set hlsearch
set ignorecase
set incsearch
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Switching Tabs
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Misc.
" show file stats
set ruler
" allow hidden buffers
set hidden
" Persistent undo, even after closing and reopening vim
set undofile
set undodir=/home/steenha/.vim_undodir

"map q: <Nop>
"map Q <Nop>
command! Wq wq

