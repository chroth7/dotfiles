nnoremap <leader>qf :call <SID>QuickfixToggle()<cr>
nnoremap <leader>qc :ccl<cr>
nnoremap <leader>qn :cn<cr>
nnoremap <leader>qp :cp<cr>
nnoremap <leader>qn :copen<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle() 
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction
