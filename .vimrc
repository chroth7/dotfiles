" The usual ------ {{{
set nocompatible              " be iMproved, required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" Plugins ------ {{{
call plug#begin('~/.vim/plugged')

" Note: use :PlugInstall to install plugins

Plug 'micha/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'benmills/vimux'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'leafgarland/typescript-vim'
Plug 'quramy/tsuquyomi'
Plug 'easymotion/vim-easymotion'
Plug 'chrisbra/NrrwRgn'

call plug#end()
" }}}

" BASICS ------ {{{
let mapleader=" "
let dotfolder="~/dotfiles/"
syntax enable
set background=dark
colorscheme solarized
set expandtab tabstop=2 shiftwidth=2

augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <leader>fs O" ABC ------ {{{<esc>FAcw
  autocmd FileType vim nnoremap <leader>fe o" }}}
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_typescript
  autocmd!
  autocmd FileType typescript setlocal foldmethod=indent
augroup END

augroup preview
  autocmd!
  autocmd CompleteDone * pclose
augroup END

set nu rnu
set hlsearch
augroup highlight
  autocmd!
  autocmd InsertEnter,InsertLeave * set cul!
augroup END

" Use very magic by default
nnoremap / /\v
nnoremap ? ?\v
cnoremap s/ s/\v

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

nnoremap <leader>hw iHello World<esc>
nnoremap <leader>hoi iHoi World<esc>
" }}}

" ANNOY ME ------ {{{
nmap <Down> <nop>
nmap <Up> <nop>
nmap <Left> <nop>
nmap <Right> <nop>
" The following are needed for autocomplete
" imap <Down> <nop>
" imap <Up> <nop>
" imap <Left> <nop>
" imap <Right> <nop>
" }}}

" COMMON ------ {{{
nnoremap <leader>ww :w<CR>
inoremap jk <esc>
" get out
nnoremap <leader>qqq :q!<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}

" NICE EXAMPLES ------ {{{
" nice examples
" remap operators
" Remember: if either we leave a visual selection, then it will work on that
" -- or it will work on the start and end positions, VIM script the hard way,
"  15.3
" operator for: inside next parentheses
onoremap in( :<c-u>normal! f(vi(<cr>
" and inside last (prev) parentheses
onoremap il( :<c-u>normal! F(vi(<cr>
" MD: change heading: (shown for special chars and execute)
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

function! SayHi(name)
  echom "Hello " . a:name
endfunction

function! Varg(...)
  echom a:0
  echom a:1
  echo a:000
endfunction

function! DeleteFirstReturn()
  execute "normal! gg/return\<cr>dd"
endfunction
nnoremap <leader>dfr :call DeleteFirstReturn()<cr>

function! TerminateLineWithSemi()
  execute "normal! mqA;\<esc>`q"
endfunction
nnoremap <leader>ts :call TerminateLineWithSemi()<cr>

" Grep example Part 1
" nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" }}}

" Plugin Related ------ {{{
" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" Nerdtree
map <leader>nt :NERDTreeToggle<CR>

" Airline
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1

" vimgutter (increase update speed)
set updatetime=100

" CtrlP
nnoremap <Leader>fb :CtrlPBuffer<CR>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fa :CtrlPMixed<CR>

" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>

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

" TYPESCEIPT
let g:tsuquyomi_completion_detail = 1

" VIMUX
let g:VimuxHeight = "15"
let g:VimuxUseNearest = 0

nnoremap <leader>cp :VimuxPromptCommand<CR>
nnoremap <leader>cc :VimuxCloseRunner<CR>

" }}}

" Abbreviations ------ {{{
abbrev @@@ christian@ambrite.ch
" }}}

" Custom Mappings ------ {{{

" NORMAL MODE
nnoremap <leader>win <c-w>
nnoremap <leader>el /\v^$\s*<cr>:nohl<cr>

" INSERT MODE
inoremap cc <c-x><c-o>

" }}}

" SNIPPETS ------ {{{
nnoremap <leader>aio :-1read $HOME/.vim/snippets/aio.ts<CR>
" }}}

