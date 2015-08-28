" MIT License. Copyright (c) 2013-2015 Bailey Ling.
" vim: et ts=2 sts=2 sw=2

" we don't actually want this loaded :P
"finish

" Due to some potential rendering issues, the use of the `space` variable is
" recommended.
let s:spc = g:airline_symbols.space

" First we define an init function that will be invoked from extensions.vim
function! airline#extensions#kanban#init(ext)
  call a:ext.add_statusline_func('airline#extensions#kanban#apply')
endfunction

" This function will be invoked just prior to the statusline getting modified.
function! airline#extensions#kanban#apply(...)
  " First we check for the filetype.
  if &filetype == 'vimwiki'
    let w:airline_section_c = '%{kanban#get_status()}'
  endif
endfunction

function! Timer()
  call feedkeys("f\e")
endfunction

augroup Kanban
  autocmd!
  " this one is which you're most likely to use?
  autocmd CursorHold * call Timer()
augroup end
