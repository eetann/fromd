" File: fromd.vim
" Author: eetann

scriptencoding utf-8
let s:save_cpoptions = &cpoptions
set cpoptions&vim

let s:mdgrammar = {
\    'LineBreak': '\v(\S\zs\s{2})$',
\        'Quote': '\v^\>+',
\         'List': '\v^(\s{4})*(\*|\-|_)\s',
\   'Horizontal': '\v^(\*|\-|_){3,}$',
\       'Italic': ['\v\_[^*]\zs\*(\_[^*]+)\*\ze\_[^*]', 
\                  '\v\_[^_]\zs_(\_[^_]+)_\ze\_[^_]'],
\         'Bold': ['\v\_[^*]\zs\*{2}(\_[^*]+)\*{2}\ze\_[^*]', 
\                  '\v\_[^_]\zs_{2}(\_[^_]+)_{2}\ze\_[^_]'],
\       'Strong': ['\v\_[^*]\zs\*{3}(\_[^*]+)\*{3}\ze\_[^*]', 
\                  '\v\_[^_]\zs_{3}(\_[^_]+)_{3}\ze\_[^_]'],
\'Strikethrough': '\v\_[^~]\zs\~{2}(\_[^~]+)\~{2}\ze\_[^~]',
\        'Table': '^|',
\   'TablePause': '\v^\|(\-|:)(\-|\|).*$',
\      'headers': ['\v^#\s','\v^#{2}\s','\v^#{3}\s','\v^#{4}\s','\v^#{5}\s','\v^#{6}\s']
\}

" 置換後の文字列
let g:grammars = {}
" FreeStyleWiki
let g:grammars['fsw'] = {
\       'LineBreak': '',
\           'Quote': '""',
\            'List': '*',
\      'Horizontal': '-',
\          'Italic': "''\1''",
\            'Bold': "'''\1'''",
\          'Strong': "'''\1'''",
\   'Strikethrough': '==\1==',
\           'Table': ',',
\         'headers': ['!!!','!!','!','!','!','!']
\}

function! Fromdlinebreak(ft)
    execute ':%s/' . s:mdgrammar['LineBreak'] . '/' . g:grammars[a:ft]['LineBreak'] . '/ge'
endfunction

function! Fromdheaders(ft)
    for head in range(len(s:mdgrammar['headers']))
        execute ':%s/' . s:mdgrammar['headers'][head] . '/' . g:grammars[a:ft]['headers'][head] . '/ge'
    endfor
endfunction

function! Fromdquote(ft)
    execute ':%s/' . s:mdgrammar['Quote'] . '/' . g:grammars[a:ft]['Quote'] . '/ge'
endfunction

function! Fromdlist(ft)
    retab 4
    let s:cursorline = 1
    while s:cursorline<=line('$')
        let s:tab_count = count(getline(s:cursorline),'    ')
        execute ':' s:cursorline . 's/' . s:mdgrammar['List']
        \ . '/' . repeat(g:grammars[a:ft]['List'], s:tab_count + 1) . '/ge'
        let s:cursorline +=1
        let s:tab_count = 0
    endwhile
endfunction


function! Fromdothers(ft)
    if &filetype ==? 'markdown'
        execute 'saveas! ' . expand('%:r') . '.txt'
        call Fromdlinebreak(a:ft)
        call Fromdquote(a:ft)
        call Fromdlist(a:ft)
        call Fromdheaders(a:ft)
    endif
endfunction

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
