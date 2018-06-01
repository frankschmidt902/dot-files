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
  "call dein#add('arcticicestudio/nord-vim') " nord color
  call dein#add('mhartington/oceanic-next') " oceanic color
  call dein#add('vim-airline/vim-airline') " bottom nav for vi
  call dein#add('vim-airline/vim-airline-themes') " airline themes
  call dein#add('jiangmiao/auto-pairs') " auto complete brackets
  call dein#add('sbdchd/neoformat') " format for prettier
  call dein#add('Shougo/deoplete.nvim') " dark powered auto complete
  call dein#add('mhartington/nvim-typescript') "TS completion
  call dein#add('leafgarland/typescript-vim') "TS Highlighting
  call dein#add('cloudhead/neovim-fuzzy') " fuzzy finder
  call dein#add('mhartington/nvim-typescript') " dein TS support
  call dein#add('wokalski/autocomplete-flow') " dein JS support
  call dein#add('godlygeek/tabular') " Get that sweet sweet comment aligns
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

set termguicolors " gotta have nice colors in my term
colorscheme OceanicNext
" Set airline theme
let g:airline_theme='oceanicnext'


" Map the leader key to SPACE
let mapleader="\<SPACE>"

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them. set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

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

" turn off shitty TS indent
let g:typescript_indent_disable = 1

"Make Neoformat run on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" only use Prettier on TS since TSFMT is a mess
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_html= ['html-beautify']
let g:neoformat_enabled_markdown = ['remark'] " only use remark since prettier is anoying for MD

" Use formatprg when available
let g:neoformat_try_formatprg = 1

" persist undos
set undodir=~/.config/nvim/undodir
set undofile
