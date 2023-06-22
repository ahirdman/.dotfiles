if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'nerdtree') ==# -1
    call add(g:sonokai_loaded_file_types, 'nerdtree')
else
    finish
endif
" syn_begin: nerdtree {{{
" https://github.com/preservim/nerdtree
highlight! link NERDTreeDir Green
highlight! link NERDTreeDirSlash Green
highlight! link NERDTreeOpenable Blue
highlight! link NERDTreeClosable Blue
highlight! link NERDTreeFile Fg
highlight! link NERDTreeExecFile Red
highlight! link NERDTreeUp Grey
highlight! link NERDTreeCWD Purple
highlight! link NERDTreeHelp Grey
highlight! link NERDTreeToggleOn Green
highlight! link NERDTreeToggleOff Red
highlight! link NERDTreeFlags Blue
highlight! link NERDTreeLinkFile Grey
highlight! link NERDTreeLinkTarget Green
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
