if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'dart') ==# -1
    call add(g:sonokai_loaded_file_types, 'dart')
else
    finish
endif
" syn_begin: dart {{{
" dart-lang: https://github.com/dart-lang/dart-vim-plugin{{{
highlight! link dartCoreClasses BlueItalic
highlight! link dartTypeName BlueItalic
highlight! link dartInterpolation Purple
highlight! link dartTypeDef Red
highlight! link dartClassDecl Red
highlight! link dartLibrary Red
highlight! link dartMetadata OrangeItalic
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
