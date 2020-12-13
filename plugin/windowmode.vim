if exists('g:loaded_windowmode') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

nnoremap <silent> <unique> <Plug>(WindowmodeEnter) <cmd>lua require('windowmode')()<CR>
nmap <silent> <unique> <C-w>w <Plug>(WindowmodeEnter)

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_windowmode = 1
