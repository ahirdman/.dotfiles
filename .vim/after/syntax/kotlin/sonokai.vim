if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'kotlin') ==# -1
    call add(g:sonokai_loaded_file_types, 'kotlin')
else
    finish
endif
" syn_begin: kotlin {{{
" kotlin-vim: https://github.com/udalov/kotlin-vim{{{
highlight! link ktSimpleInterpolation Purple
highlight! link ktComplexInterpolation Purple
highlight! link ktComplexInterpolationBrace Purple
highlight! link ktStructure Red
highlight! link ktKeyword OrangeItalic
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
