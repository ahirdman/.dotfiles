if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'cs') ==# -1
    call add(g:sonokai_loaded_file_types, 'cs')
else
    finish
endif
" syn_begin: cs {{{
" builtin: https://github.com/nickspoons/vim-cs{{{
highlight! link csUnspecifiedStatement Red
highlight! link csStorage Red
highlight! link csClass Red
highlight! link csNewType BlueItalic
highlight! link csContextualStatement Red
highlight! link csInterpolationDelimiter Purple
highlight! link csInterpolation Purple
highlight! link csEndColon Fg
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
