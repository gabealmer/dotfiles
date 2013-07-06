" Pathogen is not in the autoload dir so add it to runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set cursorline        " Show the current line
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

execute pathogen#infect()
execute pathogen#infect('bundle/{}', 'colors/{}')
syntax on
filetype plugin indent on

" Color
color molokai

" Fonts
set guifont=Inconsolata:h13
set antialias

let mapleader = ","

map <Leader>n :NERDTreeToggle<CR>

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
