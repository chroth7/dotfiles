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

call plug#end()

" BASICS
syntax enable
set background=dark
colorscheme solarized

:set number relativenumber
:set nu rnu
:autocmd InsertEnter,InsertLeave * set cul!

let mapleader=" "
nnoremap <leader>hw iHello World<esc>

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

