set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Note: use :PlugInstall to install plugins

Plug 'micha/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'benmills/vimux'
Plug 'scrooloose/nerdtree'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

call plug#end()

" BASICS
let mapleader=" "
syntax enable
set background=dark
colorscheme solarized

set number relativenumber
set nu rnu
set hlsearch
augroup highlight
  autocmd!
  autocmd InsertEnter,InsertLeave * set cul!
augroup END

nnoremap <leader>hw iHello World<esc>
nnoremap <leader>hoi iHoi World<esc>

" common
nnoremap <leader>ww :w<CR>
" get out
nnoremap <leader>qqq :q!<CR>
nnoremap <leader>src :source $MYVIMRC<CR>

" PLUGIN RELATED
" Airline
let g:airline_solarized_bg='dark'

" vimgutter (increase update speed)
set updatetime=100

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" FIND
set path +=**
set wildmenu

" VIMUX
let g:VimuxHeight = "15"
let g:VimuxUseNearest = 0

map <leader>cp :VimuxPromptCommand<CR>
map <leader>cc :VimuxCloseRunner<CR>

" SNIPPETS
nnoremap <leader>aio :-1read $HOME/.vim/snippets/aio.ts<CR>

