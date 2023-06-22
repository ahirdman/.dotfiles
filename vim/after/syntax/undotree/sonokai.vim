if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'undotree') ==# -1
    call add(g:sonokai_loaded_file_types, 'undotree')
else
    finish
endif
let s:configuration = sonokai#get_configuration()
let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)
" syn_begin: undotree {{{
" https://github.com/mbbill/undotree
call sonokai#highlight('UndotreeSavedBig', s:palette.red, s:palette.none, 'bold')
highlight! link UndotreeNode Blue
highlight! link UndotreeNodeCurrent Purple
highlight! link UndotreeSeq Green
highlight! link UndotreeCurrent Blue
highlight! link UndotreeNext Yellow
highlight! link UndotreeTimeStamp Grey
highlight! link UndotreeHead Purple
highlight! link UndotreeBranch Blue
highlight! link UndotreeSavedSmall Red
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
