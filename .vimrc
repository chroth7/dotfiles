set nocompatible              " be iMproved, required

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
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'leafgarland/typescript-vim'
Plug 'quramy/tsuquyomi'

call plug#end()

" BASICS
let mapleader=" "
syntax enable
set background=dark
colorscheme solarized

set nu rnu
set hlsearch
augroup highlight
  autocmd!
  autocmd InsertEnter,InsertLeave * set cul!
augroup END

nnoremap <leader>hw iHello World<esc>
nnoremap <leader>hoi iHoi World<esc>

" Annoy me
nmap <Down> <nop>
nmap <Up> <nop>
nmap <Left> <nop>
nmap <Right> <nop>
imap <Down> <nop>
imap <Up> <nop>
imap <Left> <nop>
imap <Right> <nop>

" common
nnoremap <leader>ww :w<CR>
inoremap jk <esc>
" get out
nnoremap <leader>qqq :q!<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" nice examples
" remap operators
" Remember: if either we leave a visual selection, then it will work on that
" -- or it will work on the start and end positions, VIM script the hard way,
"  15.3
" operator for: inside next parentheses
:onoremap in( :<c-u>normal! f(vi(<cr>
" and inside last (prev) parentheses
:onoremap il( :<c-u>normal! F(vi(<cr>
" MD: change heading: (shown for special chars and execute)
:onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

" PLUGIN RELATED
" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

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

nnoremap <leader>cp :VimuxPromptCommand<CR>
nnoremap <leader>cc :VimuxCloseRunner<CR>

" Abbreviations
abbrev @@@ christian@ambrite.ch

" CUSTOM MAPPINGS

" SNIPPETS
nnoremap <leader>aio :-1read $HOME/.vim/snippets/aio.ts<CR>
