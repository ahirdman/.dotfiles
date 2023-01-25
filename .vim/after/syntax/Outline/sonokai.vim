if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'Outline') ==# -1
    call add(g:sonokai_loaded_file_types, 'Outline')
else
    finish
endif
" syn_begin: Outline {{{
" https://github.com/simrat39/symbols-outline.nvim
highlight! link FocusedSymbol NormalFloat
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
