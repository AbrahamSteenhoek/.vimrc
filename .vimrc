autocmd! BufWritePost .vimrc source %
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off


" PLUGINS -------------------------------------------------
" Load plugins here (pathogen or vundle)
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" fuzzy finder for console
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'machakann/vim-highlightedyank'

" Auto-complete tool
" Plugin 'Valloric/YouCompleteMe'

" Nerdtree stuff
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" for the vscode dark color theme
Plugin 'tomasiser/vim-code-dark'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" PLUGINS -------------------------------------------------

if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

let g:ycm_auto_trigger = 0

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

"" Blink cursor on insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

" Encoding
set encoding=utf-8

" Cursor motion
set scrolloff=5
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines (in case lines wrap)
nnoremap j gj
nnoremap k gk

" disable wrap
set nowrap

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
" nnoremap / /\v
" vnoremap / /\v
set hlsearch
set ignorecase
set incsearch
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Enter puts a newline below the cursor
" (presses 'o' without going into Insert Mode)
"nmap <S-Enter> O<Esc>
"nmap <CR> o<Esc>


" Ctrl-J is the opposite of Shift-J
nnoremap <C-j> i<CR><Esc>k$

" display extraneous whitespace
set list listchars=tab:→\ ,trail:·

" disable beeps
set noerrorbells
set visualbell
set t_vb=

" indentation
set autoindent

" filename completion
set wildmenu
set wildmode=list:longest,full

" Keep paste buffer over all vim buffers
set mouse=a
if !has('nvim')
set clipboard=unnamed,autoselect,exclude:cons\|linux
else
set clipboard+=unnamedplus
endif



" VISUAL SETTINGS -----------------------------------------
" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set softtabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Visualize tabs and newlines
"set listchars=tab:▸\ ,eol:¬
" Color scheme (terminal)
set t_Co=256
"set t_ut=
colorscheme codedark

" yank highlighting
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = -1
