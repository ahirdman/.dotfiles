if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'elixir') ==# -1
    call add(g:sonokai_loaded_file_types, 'elixir')
else
    finish
endif
" syn_begin: elixir {{{
" vim-elixir: https://github.com/elixir-editors/vim-elixir{{{
highlight! link elixirStringDelimiter Yellow
highlight! link elixirKeyword Red
highlight! link elixirInterpolation Purple
highlight! link elixirInterpolationDelimiter Purple
highlight! link elixirSelf BlueItalic
highlight! link elixirPseudoVariable OrangeItalic
highlight! link elixirModuleDefine Red
highlight! link elixirBlockDefinition Red
highlight! link elixirDefine Red
highlight! link elixirPrivateDefine Red
highlight! link elixirGuard Red
highlight! link elixirPrivateGuard Red
highlight! link elixirProtocolDefine Red
highlight! link elixirImplDefine Red
highlight! link elixirRecordDefine Red
highlight! link elixirPrivateRecordDefine Red
highlight! link elixirMacroDefine Red
highlight! link elixirPrivateMacroDefine Red
highlight! link elixirDelegateDefine Red
highlight! link elixirOverridableDefine Red
highlight! link elixirExceptionDefine Red
highlight! link elixirCallbackDefine Red
highlight! link elixirStructDefine Red
highlight! link elixirExUnitMacro Red
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
