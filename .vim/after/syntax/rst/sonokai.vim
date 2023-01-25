if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'rst') ==# -1
    call add(g:sonokai_loaded_file_types, 'rst')
else
    finish
endif
let s:configuration = sonokai#get_configuration()
let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)
" syn_begin: rst {{{
" builtin: https://github.com/marshallward/vim-restructuredtext{{{
call sonokai#highlight('rstStandaloneHyperlink', s:palette.purple, s:palette.none, 'underline')
call sonokai#highlight('rstEmphasis', s:palette.none, s:palette.none, 'italic')
call sonokai#highlight('rstStrongEmphasis', s:palette.none, s:palette.none, 'bold')
call sonokai#highlight('rstStandaloneHyperlink', s:palette.blue, s:palette.none, 'underline')
call sonokai#highlight('rstHyperlinkTarget', s:palette.blue, s:palette.none, 'underline')
highlight! link rstSubstitutionReference Blue
highlight! link rstInterpretedTextOrHyperlinkReference Green
highlight! link rstTableLines Grey
highlight! link rstInlineLiteral Green
highlight! link rstLiteralBlock Green
highlight! link rstQuotedLiteralBlock Green
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
