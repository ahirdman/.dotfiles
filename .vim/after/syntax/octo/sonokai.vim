if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'octo') ==# -1
    call add(g:sonokai_loaded_file_types, 'octo')
else
    finish
endif
let s:configuration = sonokai#get_configuration()
let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)
" syn_begin: octo {{{
" https://github.com/pwntester/octo.nvim
call sonokai#highlight('OctoViewer', s:palette.bg0, s:palette.blue)
call sonokai#highlight('OctoGreenFloat', s:palette.green, s:palette.bg2)
call sonokai#highlight('OctoRedFloat', s:palette.red, s:palette.bg2)
call sonokai#highlight('OctoPurpleFloat', s:palette.purple, s:palette.bg2)
call sonokai#highlight('OctoYellowFloat', s:palette.yellow, s:palette.bg2)
call sonokai#highlight('OctoBlueFloat', s:palette.blue, s:palette.bg2)
call sonokai#highlight('OctoGreyFloat', s:palette.grey, s:palette.bg2)
call sonokai#highlight('OctoBubbleGreen', s:palette.bg0, s:palette.green)
call sonokai#highlight('OctoBubbleRed', s:palette.bg0, s:palette.red)
call sonokai#highlight('OctoBubblePurple', s:palette.bg0, s:palette.purple)
call sonokai#highlight('OctoBubbleYellow', s:palette.bg0, s:palette.yellow)
call sonokai#highlight('OctoBubbleBlue', s:palette.bg0, s:palette.blue)
call sonokai#highlight('OctoBubbleGrey', s:palette.bg0, s:palette.grey)
highlight! link OctoGreen Green
highlight! link OctoRed Red
highlight! link OctoPurple Purple
highlight! link OctoYellow Yellow
highlight! link OctoBlue Blue
highlight! link OctoGrey Grey
highlight! link OctoBubbleDelimiterGreen Green
highlight! link OctoBubbleDelimiterRed Red
highlight! link OctoBubbleDelimiterPurple Purple
highlight! link OctoBubbleDelimiterYellow Yellow
highlight! link OctoBubbleDelimiterBlue Blue
highlight! link OctoBubbleDelimiterGrey Grey
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
