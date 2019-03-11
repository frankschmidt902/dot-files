if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/fschmidt/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/fschmidt/.vim/bundles')
  call dein#begin('/Users/fschmidt/.vim/bundles')
  call dein#add('/Users/fschmidt/.vim/bundles/repos/github.com/Shougo/dein.vim')
  " Add or remove your plugins here:
  call dein#add('leafgarland/typescript-vim') " TS Syntax
  call dein#add('Shougo/deoplete.nvim') " dark powered auto complete
  call dein#add('cloudhead/neovim-fuzzy') " fuzzy finder
  call dein#add('jiangmiao/auto-pairs') " auto complete brackets
  call dein#add('bling/vim-airline') " Airline support
  call dein#add('godlygeek/tabular') " Tab Formating 
  call dein#add('airblade/vim-gitgutter') " Git Gutter 
  call dein#add('mhartington/oceanic-next') " Color theme 
  call dein#add('prettier/vim-prettier', { 'do': 'npm install' }) " Prettier for VI
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" Theme
if (has("termguicolors"))
 set termguicolors
endif
colorscheme OceanicNext

" Map the leader key to SPACE
let mapleader="\<SPACE>"

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them. set expandtab           " Insert spaces when TAB is pressed.
" Render TABs using this many spaces. and set indent amount to 2
set tabstop=2 shiftwidth=2 expandtab

set noerrorbells        " No beeps.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Fuzzy!
nnoremap <C-p> :FuzzyOpen<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" Equalize all the panes
nnoremap <Leader>eq :new \| :q<cr>

" Allow mouse control
set mouse=a

" persist undos
set undodir=~/.config/nvim/undodir
set undofile
