" File: fromd.vim
" Author: eetann

scriptencoding utf-8

if exists('g:loaded_fromd')
    finish
endif
let g:loaded_fromd = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

command! -nargs=1 Fromd call Fromdothers(<f-args>)

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
