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
  call dein#add('leafgarland/typescript-vim')  " ts vi support
  call dein#add('jiangmiao/auto-pairs')  " auto close the fucking brackets 
  call dein#add('christoomey/vim-tmux-navigator') " vi and tmux nav
  call dein#add('benmills/vimux') " run commands in vi
  call dein#add('vim-airline/vim-airline') " bottom nav for vi
  call dein#add('vim-airline/vim-airline-themes') " airline themes 
  call dein#add('pangloss/vim-javascript') " JS syntax
  call dein#add('cakebaker/scss-syntax.vim') " sccss syntax
  call dein#add('kien/ctrlp.vim') " search for files
  call dein#add('neomake/neomake') " linting
  call dein#add('Valloric/YouCompleteMe', {'merged': 0}) " linting
  call dein#add('sbdchd/neoformat') " prettier linting

call dein#end()
call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" Map the leader key to SPACE
let mapleader="\<SPACE>"

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

set number                     " Show current line number
set relativenumber             " Show relative line numbers

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

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Seet airline theme
let g:airline_theme='papercolor'

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>r :CtrlPMRUFiles<CR>

" neoMake run on every write
autocmd! BufWritePost * Neomake
let g:neomake_typescript_enabled_makers = []

" run NeoForm/Prettier on save
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" persist undos
set undodir=~/.config/nvim/undodir
set undofile

