" Pathogen is not in the autoload dir so add it to runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set cursorline        " Show the current line
set encoding=utf-8    " Set default encoding to UTF-8

set nobackup
set nowritebackup
" set noswapfile
" set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

set ignorecase
set smartcase

set autoread

" set shortmess+=I

let mapleader = '\'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-sensible'
" Plugin 'ervandew/supertab'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-endwise'
" Plugin 'tpope/vim-rake'
" Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
" Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/matchit.zip'
Plugin 'airblade/vim-gitgutter'
Plugin 'kana/vim-textobj-entire'
Plugin 'vim-scripts/textobj-user'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
" Plugin 'regedarek/ZoomWin'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'othree/html5.vim'
" Plugin 'wesQ3/vim-windowswap'
" Bundle 'vimwiki/vimwiki'
" Bundle 'munen/find_yaml_key'
Plugin 'slim-template/vim-slim.git'
" Plugin 'lukerandall/haskellmode-vim'
" Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'derekwyatt/vim-scala'
" Plugin 'christoomey/vim-tmux-navigator'
Plugin 't9md/vim-chef'
Plugin 'lervag/vimtex'
Plugin 'ngmy/vim-rubocop'
Plugin 'jgdavey/vim-blockle'
Plugin 'tpope/vim-abolish'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chriskempson/base16-vim'
Plugin 'gorodinskiy/vim-coloresque'

call vundle#end()

" execute pathogen#infect()
" execute pathogen#infect('bundle/{}', 'colors/{}')
syntax enable         " Turn on syntax highlighting allowing local overrides
filetype plugin indent on

" Color
"color molokai
" set background=dark
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_termcolors=16
" colorscheme solarized
colorscheme base16-default-dark

" Fonts
set guifont=Inconsolata\ for\ Powerline:h14
set antialias

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

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

nnoremap <f5> :!ctags -R --languages=ruby --exclude=.git --exclude=log<CR>
nnoremap <silent> <f6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

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
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

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

cnoreabbrev AG Ag

let g:vimwiki_list = [{'path':'~/.notes'}]

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_ruby_checkers = ['mri']

" Rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l


let g:vimrubocop_config = '~/projects/.rubocop.yml'
let g:jsx_ext_required = 0
