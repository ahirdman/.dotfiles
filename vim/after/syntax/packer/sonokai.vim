if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'packer') ==# -1
    call add(g:sonokai_loaded_file_types, 'packer')
else
    finish
endif
" syn_begin: packer {{{
" https://github.com/wbthomason/packer.nvim
highlight! link packerSuccess Green
highlight! link packerFail Red
highlight! link packerStatusSuccess Fg
highlight! link packerStatusFail Fg
highlight! link packerWorking Yellow
highlight! link packerString Yellow
highlight! link packerPackageNotLoaded Grey
highlight! link packerRelDate Grey
highlight! link packerPackageName Blue
highlight! link packerOutput Orange
highlight! link packerHash Blue
highlight! link packerTimeTrivial Blue
highlight! link packerTimeHigh Red
highlight! link packerTimeMedium Yellow
highlight! link packerTimeLow Green
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
