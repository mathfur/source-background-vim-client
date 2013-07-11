if exists("g:loaded_source_background_vim_client")
  finish
endif
let g:loaded_source_background_vim_client = 1

let s:save_cpo = &cpo
set cpo&vim

if exists("g:source_background_vim_client")
  command! -nargs=0 EnableSoureBackground call source_background_vim_client#enable()
  command! -nargs=0 DisableSoureBackground call source_background_vim_client#disable()
endif

let &cpo = s:save_cpo
unlet s:save_cpo
