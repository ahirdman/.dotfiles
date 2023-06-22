if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'help') ==# -1
    call add(g:sonokai_loaded_file_types, 'help')
else
    finish
endif
let s:configuration = sonokai#get_configuration()
let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)
" syn_begin: help {{{
call sonokai#highlight('helpNote', s:palette.purple, s:palette.none, 'bold')
call sonokai#highlight('helpHeadline', s:palette.red, s:palette.none, 'bold')
call sonokai#highlight('helpHeader', s:palette.orange, s:palette.none, 'bold')
call sonokai#highlight('helpURL', s:palette.green, s:palette.none, 'underline')
call sonokai#highlight('helpHyperTextEntry', s:palette.blue, s:palette.none, 'bold')
highlight! link helpHyperTextJump Blue
highlight! link helpCommand Yellow
highlight! link helpExample Green
highlight! link helpSpecial Purple
highlight! link helpSectionDelim Grey
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
