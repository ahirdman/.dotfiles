if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'haskell') ==# -1
    call add(g:sonokai_loaded_file_types, 'haskell')
else
    finish
endif
" syn_begin: haskell {{{
" haskell-vim: https://github.com/neovimhaskell/haskell-vim{{{
highlight! link haskellBrackets Fg
highlight! link haskellIdentifier OrangeItalic
highlight! link haskellDecl Red
highlight! link haskellType BlueItalic
highlight! link haskellDeclKeyword Red
highlight! link haskellWhere Red
highlight! link haskellDeriving Red
highlight! link haskellForeignKeywords Red
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
