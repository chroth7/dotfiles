" Plugins
call plug#begin("~/.vim/plugged")
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'overcache/NeoSolarized'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-vinegar'
  Plug 'easymotion/vim-easymotion'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'haya14busa/incsearch.vim'
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
  Plug 'RishabhRD/popfix'
  Plug 'RishabhRD/nvim-lsputils'
call plug#end()

"temporary
set noswapfile

" general
colorscheme NeoSolarized
set termguicolors " for NeoSolarized
set noerrorbells
set expandtab tabstop=2 shiftwidth=2
set splitbelow
set splitright
syntax enable " TODO: needed?
vmap '' :w !pbcopy<CR><CR>
set nu rnu
abbrev @@@ christian@ambrite.ch

" variables
let mapleader=" "

" basic remaps
inoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ww :w<CR>
nnoremap [g :PrevDiagnosticCycle<CR>
nnoremap ]g :NextDiagnosticCycle<CR>

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

nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" PLUGINS

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" UltiSnips
nnoremap <leader>use :UltiSnipsEdit<CR>
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Telescope
lua <<EOF
-- totally optional to use setup
require('telescope').setup{
  defaults = {
    shorten_path = false -- currently the default value is true
  }
}
EOF

nnoremap \ :lua require('telescope.builtin').live_grep{}<CR>
nnoremap <leader>ff :lua require('telescope.builtin').git_files{}<CR>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>ft <cmd>Telescope tags<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fl <cmd>Telescope reloader<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>s <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" netrw
map <leader>nn :Ex<CR>
map <leader>nv :Vex<CR>
map <leader>ns :Sex<CR>
let g:netrw_liststyle=1

" Prettier
let g:prettier#autoformat = 0
augroup prettier
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.mdx Prettier
augroup END

nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
" conflict
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> rn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ac    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> lsp    <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
nnoremap <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>


" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
vnoremap <leader>gbr :Gbrowse<CR>
nnoremap <leader>gbr :Gbrowse<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpS :Dispatch! git push --set-upstream origin $(git_current_branch)<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" FILETYPES
augroup filetype_typescriptreact
  autocmd!
  autocmd FileType typescriptreact setlocal filetype=typescript.tsx
  " autocmd BufWritePre * %s/\s\+$//e
augroup END

" lsp - do that at the end
" Install tsserver using: `:LspInstall tsserver`
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_enable_auto_popup = 0
" inoremap <silent><expr> <c-p> completion#trigger_completion()
inoremap <silent><expr> <tab> completion#trigger_completion()

let g:completion_enable_snippet = 'UltiSnips'
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:diagnostic_enable_virtual_text = 1
let g:space_before_virtual_text = 10
let g:diagnostic_virtual_text_prefix = '‡'

lua <<EOF
local lspconfig = require'lspconfig'
lspconfig.diagnosticls.setup {
  filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact", "javascript.jsx", "typescript.tsx"},
  init_options = {
    filetypes = {
      javascript = "eslint",
      javascriptreact = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint",
      ["typescript.tsx"] = "eslint",
      ["javascript.jsx"] = "eslint"
    },
    inters = {
      eslint = {
        command = "./node_modules/.bin/eslint",
        rootPatterns = {".git"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    }
  }
}
EOF
lua require'lspconfig'.tsserver.setup{on_attach=require'on_attach'.on_attach}

" And here is where I test stuff
exec 'source ' . $HOME . "/.config/nvim/myFirstPlugin.vim"
nnoremap <leader>pp :call MyFirstPlugin()<CR>

" Terminal
nnoremap <leader>ttt :terminal<CR>
tnoremap <C-t> <C-\><C-n>

" Maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nmap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

lua <<EOF
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF
