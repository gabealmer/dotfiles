" Pathogen is not in the autoload dir so add it to runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set cursorline        " Show the current line
set encoding=utf-8    " Set default encoding to UTF-8



set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tomasr/molokai'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-sensible'
Bundle 'ervandew/supertab'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-fugitive'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/matchit.zip'
Bundle 'airblade/vim-gitgutter'
Bundle 'kana/vim-textobj-entire'
Bundle 'vim-scripts/textobj-user'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-repeat'
Bundle 'bling/vim-airline'
Bundle 'rking/ag.vim'
Bundle 'regedarek/ZoomWin'
Bundle 'tpope/vim-vinegar'
Bundle 'szw/vim-ctrlspace'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'othree/html5.vim'
Bundle 'wesQ3/vim-windowswap'
Bundle 'vimwiki/vimwiki'
Bundle 'munen/find_yaml_key'
Bundle 'slim-template/vim-slim.git'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'ecomba/vim-ruby-refactoring'

" execute pathogen#infect()
" execute pathogen#infect('bundle/{}', 'colors/{}')
syntax enable         " Turn on syntax highlighting allowing local overrides
filetype plugin indent on

" Color
"color molokai
set background=light
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

set clipboard+=unnamed

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

"vim-ctrlspace
let g:airline_exclude_preview = 1

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

" Highlight lines larger than 120 characters
" Only the 120th char
highlight rightMargin term=bold ctermfg=red guifg=red guibg=yellow
match rightMargin /\%<122v.\%>121v/

" Offer a choice of tags when several match, jump directly if there is only
" one match.
noremap <C-]> g<C-]>

cnoreabbrev FHL Tabularize /:\zs/l1c0l0
cnoreabbrev FSHL Tabularize /=>/l1c1l0
cnoreabbrev FWHL Tabularize / /l1c1l0

let g:vimwiki_list = [{'path':'~/.notes'}]

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
