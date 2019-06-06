set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" use :PlugInstall to install plugins

Plug 'micha/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'benmills/vimux'
Plug 'scrooloose/nerdtree'

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

