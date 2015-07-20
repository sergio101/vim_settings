set nocompatible               " be iMproved
"filetype off                   " required!
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Plugin 'L9'
Bundle 'Valloric/YouCompleteMe'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'FuzzyFinder'
Bundle 'AutoClose'
Bundle 'https://github.com/vim-scripts/EasyMotion.git'
Bundle 'https://github.com/vim-scripts/taglist.vim.git'
Bundle "git://github.com/sophacles/vim-bundle-sparkup.git"
Bundle 'https://github.com/vim-scripts/php.vim-html-enhanced.git'
Bundle "https://github.com/scrooloose/nerdtree.git"
Bundle 'https://github.com/ervandew/supertab.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'https://github.com/Shougo/neocomplcache.git'
Bundle 'https://github.com/kchmck/vim-coffee-script.git'
Bundle 'git://github.com/majutsushi/tagbar.git'
Bundle 'git://github.com/vim-scripts/EasyGrep.git'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/mattn/gist-vim.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'thoughtbot/vim-rspec'
Plugin 'mileszs/ack.vim'
call vundle#end()            " required

filetype plugin indent on    " required


syntax on

if has('gui_running')
  syntax enable
  set background=light
  colorscheme solarized
endif

"  ---------------------------------------------------------------------------
"    General
"  ---------------------------------------------------------------------------

" Set up syntastic
""let g:syntastic_echo_current_error=1
""let g:syntastic_enable_signs=1
""let g:syntastic_enable_highlighting = 1
""let g:syntastic_auto_loc_list=1
""let g:syntastic_auto_jump=1

" Set up status line
set laststatus=2
" Broken down into easily includeable segments
set statusline=%<%f\    " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%{fugitive#statusline()} "  Git Hotness
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" Setup tabs

set tabstop=4
set shiftwidth=4
set softtabstop=4

let mapleader = ","
let g:mapleader = ","

set cursorline
set ruler
set ttyfast

" Add coloring for easymotion..
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

"set fugitve into the mixgitive links
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" turn off tabs
set nolist

" save buffer when switching out of it
set autowrite

" quickly switch between buffers
nnoremap <leader><leader> <c-^>

" remap escape
imap jj <ESC>

" Auto format
map === mmgg=G`m^zz

"close buffer
nmap <leader>d :bd<CR>

" Toggle taglist
nmap <leader> l :TagbarToggle<CR>

" close all buffers
nmap <leader>D :bufdo bd<CR>

"saving and exit
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" Nerd Tree Settings
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50 
" open file browser
map <leader>p :NERDTreeToggle<cr>

"tags
set tags=./tags;
set tags+=gems.tags
map <leader>L :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60
"
"autocomplete
set complete=.,w,b,u,t,i

"find buffer
nmap <silent> <leader>b :FufBuffer<CR>

" View routes or Gemfile in large split
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" Skip to Model, View or Controller
map <Leader>m :Emodel 
map <Leader>v :Eview 
map <Leader>c :Econtroller 

" Set up Rails Test
let g:rubytest_in_quickfix = 1

set visualbell
set guifont=Source\ Code\ Pro:h14
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

set number
set ignorecase
set nowrap
set nolist
set incsearch
set hlsearch

let g:ackprg = 'ag --nogroup --nocolor --column'

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

