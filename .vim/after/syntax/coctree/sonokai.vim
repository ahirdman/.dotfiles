if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'coctree') ==# -1
    call add(g:sonokai_loaded_file_types, 'coctree')
else
    finish
endif
" syn_begin: coctree {{{
" https://github.com/neoclide/coc.nvim
highlight! link CocTreeOpenClose Purple
highlight! link CocTreeDescription Grey
highlight! link CocSymbolFile Green
highlight! link CocSymbolModule Red
highlight! link CocSymbolNamespace Red
highlight! link CocSymbolPackage Red
highlight! link CocSymbolClass Blue
highlight! link CocSymbolMethod Green
highlight! link CocSymbolProperty Orange
highlight! link CocSymbolField Green
highlight! link CocSymbolConstructor Green
highlight! link CocSymbolEnum Blue
highlight! link CocSymbolInterface Blue
highlight! link CocSymbolFunction Green
highlight! link CocSymbolVariable Orange
highlight! link CocSymbolConstant Orange
highlight! link CocSymbolString Yellow
highlight! link CocSymbolNumber Yellow
highlight! link CocSymbolBoolean Yellow
highlight! link CocSymbolArray Yellow
highlight! link CocSymbolObject Yellow
highlight! link CocSymbolKey Red
highlight! link CocSymbolNull Yellow
highlight! link CocSymbolEnumMember Orange
highlight! link CocSymbolStruct Blue
highlight! link CocSymbolEvent Yellow
highlight! link CocSymbolOperator Yellow
highlight! link CocSymbolTypeParameter Blue
highlight! link CocSymbolDefault Yellow
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
