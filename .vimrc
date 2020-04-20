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

" Note: First source the vim again (<leader>sv)
" Note: and then use :PlugInstall to install plugins

" Plug 'w0rp/ale'
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
" Plug 'quramy/tsuquyomi'
Plug 'easymotion/vim-easymotion'
Plug 'chrisbra/NrrwRgn'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nbouscal/vim-stylish-haskell'
Plug 'Chiel92/vim-autoformat'
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

" Haskell Plugins
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

call plug#end()
" }}}

" BASICS ------ {{{
let mapleader=" "
let dotfolder="~/dotfiles/"
syntax enable
set background=dark
colorscheme solarized
set expandtab tabstop=2 shiftwidth=2
set splitbelow
set splitright
set backspace=2

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsEditSplit="vertical"
nnoremap <leader>use :UltiSnipsEdit<CR>

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

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in ctrlp
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Use very magic by default
nnoremap / /\v
nnoremap ? ?\v
" cnoremap s/ s/\v

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>
nnoremap <C-c> :bp\|bd #<CR>

" Panes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>hw iHello World<esc>
nnoremap <leader>hoi iHoi World<esc>

" Tagbar
nnoremap <leader>tt :TagbarToggle<CR>
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
augroup prettier
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.mdx Prettier
augroup END

" Nerdtree
map <leader>n :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden = 1

" ALE
" let g:airline#extensions#ale#enabled = 1
" let g:ale_linters = {
"       \ 'typescript': ['tslint'],
"       \ 'haskell': ['stack-ghc', 'ghc-mod', 'hlint', 'hdevtools', 'hfmt']
"       \ }

" Tagbar
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" Airline
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" vimgutter (increase update speed)
set updatetime=100

" CtrlP
nnoremap <Leader>fb :CtrlPBuffer<CR>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fa :CtrlPMixed<CR>
nnoremap <Leader>ft :CtrlPTag<CR>

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
" this makes it slow...
" let g:tsuquyomi_completion_detail = 1
" let g:tsuquyomi_disable_quickfix = 0

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

" }}}

" SNIPPETS ------ {{{
nnoremap <leader>use :UltiSnipsEdit<CR>
nnoremap <leader>aio :-1read $HOME/.vim/snippets/aio.ts<CR>
nnoremap <leader>dtest :-1read $HOME/.vim/snippets/dummytest.ts<CR>
nnoremap <leader>dcbd :-1read $HOME/.vim/snippets/dcbd<CR>
nnoremap <leader>clg :-1read $HOME/.vim/snippets/clg.ts<CR>$hi
" }}}

" Filetype MORE THAN ONE ------ {{{

" }}}

" Filetype: VIM ------ {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <leader>fs O" ABC ------ {{{<esc>FAcw
  autocmd FileType vim nnoremap <leader>fe o" }}}
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Filetype: TYPESCRIPT ------ {{{
augroup filetype_typescript
  autocmd!
  " autocmd FileType typescript setlocal foldmethod=indent
  autocmd FileType typescript nnoremap <leader>lg iconsole.log()<esc>i
augroup END
" }}}

" Filetype: TYPESCRIPTREACT ------ {{{
augroup filetype_typescriptreact
  autocmd!
  autocmd FileType typescriptreact setlocal filetype=typescript.tsx
  " autocmd FileType typescript.tsx setlocal foldmethod=indent
  autocmd FileType typescript.tsx nnoremap <leader>lg iconsole.log()<esc>i
augroup END
" }}}

" Filetype: HASKELL ------ {{{
nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
nnoremap <Leader>hc :GhcModCheck<cr>
nnoremap <Leader>hl :GhcModLint<cr>
autocmd FileType haskell nnoremap <buffer> <leader>? :call
" }}}

" SCALA ------ {{{
au BufRead,BufNewFile *.sbt set filetype=scala
" }}}

" COC ------ {{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" }}}
