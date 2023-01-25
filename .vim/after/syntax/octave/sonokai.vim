if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'octave') ==# -1
    call add(g:sonokai_loaded_file_types, 'octave')
else
    finish
endif
" syn_begin: octave {{{
" vim-octave: https://github.com/McSinyx/vim-octave{{{
highlight! link octaveDelimiter Orange
highlight! link octaveSemicolon Grey
highlight! link octaveOperator Orange
highlight! link octaveVariable BlueItalic
highlight! link octaveVarKeyword BlueItalic
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
