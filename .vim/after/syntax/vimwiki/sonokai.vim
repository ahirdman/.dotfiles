if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'vimwiki') ==# -1
    call add(g:sonokai_loaded_file_types, 'vimwiki')
else
    finish
endif
let s:configuration = sonokai#get_configuration()
let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)
" syn_begin: vimwiki {{{
call sonokai#highlight('VimwikiHeader1', s:palette.red, s:palette.none, 'bold')
call sonokai#highlight('VimwikiHeader2', s:palette.orange, s:palette.none, 'bold')
call sonokai#highlight('VimwikiHeader3', s:palette.yellow, s:palette.none, 'bold')
call sonokai#highlight('VimwikiHeader4', s:palette.green, s:palette.none, 'bold')
call sonokai#highlight('VimwikiHeader5', s:palette.blue, s:palette.none, 'bold')
call sonokai#highlight('VimwikiHeader6', s:palette.purple, s:palette.none, 'bold')
call sonokai#highlight('VimwikiLink', s:palette.blue, s:palette.none, 'underline')
call sonokai#highlight('VimwikiItalic', s:palette.none, s:palette.none, 'italic')
call sonokai#highlight('VimwikiBold', s:palette.none, s:palette.none, 'bold')
call sonokai#highlight('VimwikiUnderline', s:palette.none, s:palette.none, 'underline')
highlight! link VimwikiList Red
highlight! link VimwikiTag Blue
highlight! link VimwikiCode Green
highlight! link VimwikiHR Yellow
highlight! link VimwikiHeaderChar Grey
highlight! link VimwikiMarkers Grey
highlight! link VimwikiPre Green
highlight! link VimwikiPreDelim Green
highlight! link VimwikiNoExistsLink Red
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
