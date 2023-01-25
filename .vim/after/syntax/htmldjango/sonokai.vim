if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'htmldjango') ==# -1
    call add(g:sonokai_loaded_file_types, 'htmldjango')
else
    finish
endif
" syn_begin: htmldjango {{{
" builtin: https://github.com/vim/vim/blob/master/runtime/syntax/htmldjango.vim{{{
highlight! link djangoTagBlock Yellow
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
