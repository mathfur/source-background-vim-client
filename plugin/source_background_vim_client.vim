if exists("g:loaded_source_background_vim_client")
  finish
endif
let g:loaded_source_background_vim_client = 1

let s:save_cpo = &cpo
set cpo&vim

if exists("g:source_background_vim_client")
  autocmd CursorMoved * call source_background_vim_client#cursor_moved()
endif

let &cpo = s:save_cpo
unlet s:save_cpo
