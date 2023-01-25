if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'zsh') ==# -1
    call add(g:sonokai_loaded_file_types, 'zsh')
else
    finish
endif
" syn_begin: sh/zsh {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
highlight! link shRange Fg
highlight! link shOption Purple
highlight! link shQuote Yellow
highlight! link shVariable BlueItalic
highlight! link shDerefSimple BlueItalic
highlight! link shDerefVar BlueItalic
highlight! link shDerefSpecial BlueItalic
highlight! link shDerefOff BlueItalic
highlight! link shVarAssign Red
highlight! link shFunctionOne Green
highlight! link shFunctionKey Red
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
" syn_begin: zsh {{{
" builtin: https://github.com/chrisbra/vim-zsh{{{
highlight! link zshOption BlueItalic
highlight! link zshSubst Orange
highlight! link zshFunction Green
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
