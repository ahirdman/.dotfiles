if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'python') ==# -1
    call add(g:sonokai_loaded_file_types, 'python')
else
    finish
endif
let s:configuration = sonokai#get_configuration()
let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)
" syn_begin: python {{{
" builtin: {{{
highlight! link pythonBuiltin BlueItalic
highlight! link pythonExceptions Red
highlight! link pythonDecoratorName OrangeItalic
" }}}
" python-syntax: https://github.com/vim-python/python-syntax{{{
highlight! link pythonExClass BlueItalic
highlight! link pythonBuiltinType BlueItalic
highlight! link pythonBuiltinObj OrangeItalic
highlight! link pythonDottedName OrangeItalic
highlight! link pythonBuiltinFunc Green
highlight! link pythonFunction Green
highlight! link pythonDecorator OrangeItalic
highlight! link pythonInclude Include
highlight! link pythonImport PreProc
highlight! link pythonOperator Red
highlight! link pythonConditional Red
highlight! link pythonRepeat Red
highlight! link pythonException Red
highlight! link pythonNone OrangeItalic
highlight! link pythonCoding Grey
highlight! link pythonDot Grey
" }}}
" semshi: https://github.com/numirias/semshi{{{
call sonokai#highlight('semshiUnresolved', s:palette.orange, s:palette.none, 'undercurl')
highlight! link semshiImported TSInclude
highlight! link semshiParameter TSParameter
highlight! link semshiParameterUnused Grey
highlight! link semshiSelf TSVariableBuiltin
highlight! link semshiGlobal TSType
highlight! link semshiBuiltin TSTypeBuiltin
highlight! link semshiAttribute TSAttribute
highlight! link semshiLocal TSKeyword
highlight! link semshiFree TSKeyword
highlight! link semshiSelected CurrentWord
highlight! link semshiErrorSign RedSign
highlight! link semshiErrorChar RedSign
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
