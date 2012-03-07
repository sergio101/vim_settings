set nocompatible               " be iMproved
"filetype off                   " required!
filetype plugin indent on     " required! 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "git://github.com/scrooloose/syntastic.git"
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/vim-scripts/blockquote.vim.git'
Bundle 'https://github.com/vim-scripts/EasyMotion.git'
Bundle 'https://github.com/tpope/vim-commentary.git'
Bundle 'https://github.com/vim-scripts/cake.vim.git'
Bundle 'https://github.com/vim-scripts/taglist.vim.git'
Bundle "git://github.com/sophacles/vim-bundle-sparkup.git"
Bundle 'https://github.com/lukaszb/vim-web-indent.git'
Bundle 'https://github.com/vim-scripts/php.vim-html-enhanced.git'
Bundle "https://github.com/scrooloose/nerdtree.git"
Bundle 'https://github.com/ervandew/supertab.git'

runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

syntax on

"  ---------------------------------------------------------------------------
"    General
"  ---------------------------------------------------------------------------
" PHP setup
"
" Setup tabs

set tabstop=4
set shiftwidth=4
set softtabstop=4

"some sort of stuff
set relativenumber

let mapleader = ","
let g:mapleader = ","

set cursorline
set ruler
set ttyfast


" Add coloring for easymotion..
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment


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
map <leader>l :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60
"autocomplete
set complete=.,w,b,u,t,i

"find buffer
nmap <silent> <leader>b :FufBuffer<CR>


" Settings for Ruby/Rails
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>

" View routes or Gemfile in large split
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
"
" " Skip to Model, View or Controller
map <Leader>m :Rmodel 
map <Leader>v :Rview 
map <Leader>c :Rcontroller 
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby


set visualbell
set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

set number
set ignorecase
set nowrap

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
