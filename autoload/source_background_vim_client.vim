let s:save_cpo = &cpo
set cpo&vim

function! source_background_vim_client#cursor_moved()
  let topline = line('.') - winline() + 1
  let bottomline = (winheight(0) - 1) + topline
  let msg = topline . "," . bottomline . "," . winwidth(0) . "," . wincol() . "," . winline() . "," . expand("%:p")
  let sock = vimproc#socket_open('localhost', 8001)
  call sock.write(msg)
  call sock.close()
endfunction

function! source_background_vim_client#enable()
  augroup MyGroup
    autocmd!
    autocmd CursorMoved * call source_background_vim_client#cursor_moved()
  augroup END
endfunction

function! source_background_vim_client#disable()
  augroup MyGroup
    autocmd!
  augroup END
endfunction
 
let &cpo = s:save_cpo
unlet s:save_cpo
