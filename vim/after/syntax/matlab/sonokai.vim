if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'matlab') ==# -1
    call add(g:sonokai_loaded_file_types, 'matlab')
else
    finish
endif
" syn_begin: matlab {{{
" builtin: {{{
highlight! link matlabSemicolon Fg
highlight! link matlabFunction RedItalic
highlight! link matlabImplicit Green
highlight! link matlabDelimiter Fg
highlight! link matlabOperator Green
highlight! link matlabArithmeticOperator Red
highlight! link matlabArithmeticOperator Red
highlight! link matlabRelationalOperator Red
highlight! link matlabRelationalOperator Red
highlight! link matlabLogicalOperator Red
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
