if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'php') ==# -1
    call add(g:sonokai_loaded_file_types, 'php')
else
    finish
endif
" syn_begin: php {{{
" builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD{{{
highlight! link phpVarSelector Fg
highlight! link phpIdentifier Fg
highlight! link phpDefine Green
highlight! link phpStructure Red
highlight! link phpSpecialFunction Green
highlight! link phpInterpSimpleCurly Purple
highlight! link phpComparison Red
highlight! link phpMethodsVar Fg
highlight! link phpInterpVarname Fg
highlight! link phpMemberSelector Red
highlight! link phpLabel Red
" }}}
" php.vim: https://github.com/StanAngeloff/php.vim{{{
highlight! link phpParent Fg
highlight! link phpNowDoc Yellow
highlight! link phpFunction Green
highlight! link phpMethod Green
highlight! link phpClass BlueItalic
highlight! link phpSuperglobals BlueItalic
highlight! link phpNullValue OrangeItalic
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
