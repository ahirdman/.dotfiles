if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'ruby') ==# -1
    call add(g:sonokai_loaded_file_types, 'ruby')
else
    finish
endif
" syn_begin: ruby {{{
" builtin: https://github.com/vim-ruby/vim-ruby{{{
highlight! link rubyKeywordAsMethod Green
highlight! link rubyInterpolation Purple
highlight! link rubyInterpolationDelimiter Purple
highlight! link rubyStringDelimiter Yellow
highlight! link rubyBlockParameterList Fg
highlight! link rubyDefine Red
highlight! link rubyModuleName Red
highlight! link rubyAccess Red
highlight! link rubyMacro Red
highlight! link rubySymbol Fg
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
