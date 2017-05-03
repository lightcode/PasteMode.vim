" PasteMode.vim - Improved paste mode
" Author:       lightcode <http://lightcode.fr>
" Version:      1.0

if exists("g:pastemode_loaded") || &cp || v:version < 700
    finish
endif

let g:pastemode_loaded = 1

let b:pastemode_isenabled = 0


function! s:enable(bang)
    if !exists("b:pastemode_isenabled")
        return
    endif

    if b:pastemode_isenabled == 1
        if !a:bang
            echom "PasteMode is already enabled"
        endif
        return
    endif

    let b:pastemode_isenabled = 1

    let s:before_paste_wrap = &wrap
    let s:before_paste_cursorline = &cursorline
    let s:before_paste_colorcolumn = &colorcolumn
    let s:before_paste_list = &list
    let s:before_paste_number = &number

    setlocal colorcolumn=0
    setlocal nocursorline
    setlocal nolist
    setlocal nonumber
    setlocal wrap

    setlocal paste

    :GitGutterDisable
    :SyntasticReset
endfunction

function! s:disable(bang)
    if !exists("b:pastemode_isenabled")
        return
    endif

    if b:pastemode_isenabled == 0
        if !a:bang
            echom 'PasteMode is not enabled'
        endif
        return
    endif

    let b:pastemode_isenabled = 0

    let &l:wrap = s:before_paste_wrap
    let &l:cursorline = s:before_paste_cursorline
    let &l:colorcolumn = s:before_paste_colorcolumn
    let &l:list = s:before_paste_list
    let &l:number = s:before_paste_number

    setlocal nopaste

    :GitGutterEnable
    :SyntasticCheck
endfunction

function! s:toggle()
    if !exists("b:pastemode_isenabled")
        return
    endif

    if b:pastemode_isenabled == 0
        call s:enable(1)
    else
        call s:disable(1)
    endif
endfunction


command! -nargs=* -range -bang PasteModeEnable call s:enable(<bang>0)
command! -nargs=* -range -bang PasteModeDisable call s:disable(<bang>0)
command! -nargs=0 PasteModeToggle  call s:toggle()
