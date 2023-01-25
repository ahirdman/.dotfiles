if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'clojure') ==# -1
    call add(g:sonokai_loaded_file_types, 'clojure')
else
    finish
endif
" syn_begin: clojure {{{
" builtin: https://github.com/guns/vim-clojure-static{{{
highlight! link clojureMacro Red
highlight! link clojureFunc Green
highlight! link clojureConstant OrangeItalic
highlight! link clojureSpecial Red
highlight! link clojureDefine Red
highlight! link clojureKeyword Blue
highlight! link clojureVariable Fg
highlight! link clojureMeta Purple
highlight! link clojureDeref Purple
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
