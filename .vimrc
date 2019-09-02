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
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" fuzzy finder for console
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'machakann/vim-highlightedyank'

" polyglot syntax highlighting
Plugin 'sheerun/vim-polyglot'

" Auto-complete tool
" Plugin 'Valloric/YouCompleteMe'

" Nerdtree stuff
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" for the vscode dark color theme
Plugin 'tomasiser/vim-code-dark'
" onedark theme
Plugin 'joshdick/onedark.vim'
" Material theme
Plugin 'kaicataldo/material.vim'

" Git wrapper for vim
Plugin 'tpope/vim-fugitive'

" highlighting for f,F,t,T
Plugin 'unblevable/quick-scope'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" PLUGINS -------------------------------------------------

if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

let g:ycm_auto_trigger = 0

" Turn on syntax highlighting
syntax on

" Relative line numbers
set nu rnu

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Colored column at 80 chars
set colorcolumn=80

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
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')


" Allow hidden buffers
set hidden

" NERDTree stuff==================================
" Map Ctrl-n to NerdTree
map <C-n> :NERDTreeToggle<CR>
" NERDTress File highlighting function
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Persistent undo, even after closing and repoening Vim.
set undofile

" Instead of stumbling into ex mode, repeat the last macro used.
nnoremap Q @@

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
set t_ut=

"let g:onedark_termcolors=16
" coloring theme

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif
let g:material_theme_style = 'darker'
colorscheme material

" yank highlighting
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 500


" disable wrap
set nowrap
