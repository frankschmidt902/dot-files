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
  call dein#add('christoomey/vim-tmux-navigator') " vi and tmux nav
  call dein#add('benmills/vimux') " run commands in vi
  call dein#add('dracula/vim') " dracula color
  call dein#add('vim-airline/vim-airline') " bottom nav for vi
  call dein#add('vim-airline/vim-airline-themes') " airline themes
  call dein#add('sbdchd/neoformat') " format for prettier
  call dein#add('leafgarland/typescript-vim') " TS Syntax 
  call dein#add('Shougo/deoplete.nvim') " dark powered auto complete
  call dein#add('cloudhead/neovim-fuzzy') " fuzzy finder
  call dein#add('jiangmiao/auto-pairs') " auto complete brackets
  call dein#add('digitaltoad/vim-pug') " Pug template syntax
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

set termguicolors " gotta have nice colors in my term
color dracula
" Set airline theme
let g:airline_theme='bubblegum'


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

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

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

"Make Neoformat run on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" only use Prettier on TS since TSFMT is a mess
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_html= ['html-beautify']
let g:neoformat_enabled_markdown = ['remark'] " only use remark since prettier is anoying for MD

" persist undos
set undodir=~/.config/nvim/undodir
set undofile
