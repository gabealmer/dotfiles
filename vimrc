" Pathogen is not in the autoload dir so add it to runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set cursorline        " Show the current line
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

execute pathogen#infect()
execute pathogen#infect('bundle/{}', 'colors/{}')
syntax on
filetype plugin indent on

" Color
"color molokai
set background=dark
colorscheme solarized

" Fonts
set guifont=Inconsolata\ for\ Powerline:h14
set antialias

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

if has('clipboard')
  set clipboard=unnamed
endif

" treat all numbers as decimals
set nrformats=

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set hlsearch    " highlight matches
set incsearch   " incremental searching
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

nnoremap <f5> :!ctags -R<CR>

" Use powerline pathced fonts
let g:airline_powerline_fonts = 1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" changes the cursor shape/color in console
" " in the terminal depending on the mode
if &term =~ "xterm\\|rxvt"
  " use a | cursor in insert mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"

  " use a rectangle cursor otherwise
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  autocmd VimLeave * silent !echo -ne "\<Esc>]50;CursorShape=0\x7"
endif
