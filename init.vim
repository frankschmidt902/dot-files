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
  call dein#add('vim-airline/vim-airline') " bottom nav for vi
  call dein#add('vim-airline/vim-airline-themes') " airline themes
  call dein#add('jiangmiao/auto-pairs') " auto complete brackets
  call dein#add('brooth/far.vim') " search and replace 
  call dein#add('Shougo/deoplete.nvim') " dark powered auto complete
  call dein#add('cloudhead/neovim-fuzzy') " fuzzy finder 
  call dein#add('mhartington/nvim-typescript') " dein TS support
  call dein#add('wokalski/autocomplete-flow') " dein JS support
  call dein#add('Shougo/neosnippet') " snippt support
  call dein#add('Shougo/neosnippet-snippets') " snippts 
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
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

" Set airline theme
let g:airline_theme='papercolor'

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

" Fuzzy! with Leader + p 
nnoremap <C-p> :FuzzyOpen<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use neosnippt.
let g:neosnippet#enable_completed_snippet = 1

" persist undos
set undodir=~/.config/nvim/undodir
set undofile
