if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'make') ==# -1
    call add(g:sonokai_loaded_file_types, 'make')
else
    finish
endif
" syn_begin: make {{{
highlight! link makeIdent Purple
highlight! link makeSpecTarget BlueItalic
highlight! link makeTarget Orange
highlight! link makeCommands Red
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
