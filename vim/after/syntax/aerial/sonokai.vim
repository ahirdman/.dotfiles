if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'aerial') ==# -1
    call add(g:sonokai_loaded_file_types, 'aerial')
else
    finish
endif
" syn_begin: aerial {{{
" https://github.com/stevearc/aerial.nvim
highlight! link AerialLine CursorLine
highlight! link AerialGuide LineNr
highlight! link AerialFileIcon Green
highlight! link AerialModuleIcon Red
highlight! link AerialNamespaceIcon Red
highlight! link AerialPackageIcon Red
highlight! link AerialClassIcon Blue
highlight! link AerialMethodIcon Green
highlight! link AerialPropertyIcon Orange
highlight! link AerialFieldIcon Green
highlight! link AerialConstructorIcon Green
highlight! link AerialEnumIcon Blue
highlight! link AerialInterfaceIcon Blue
highlight! link AerialFunctionIcon Green
highlight! link AerialVariableIcon Orange
highlight! link AerialConstantIcon Orange
highlight! link AerialStringIcon Yellow
highlight! link AerialNumberIcon Yellow
highlight! link AerialBooleanIcon Yellow
highlight! link AerialArrayIcon Yellow
highlight! link AerialObjectIcon Yellow
highlight! link AerialKeyIcon Red
highlight! link AerialNullIcon Yellow
highlight! link AerialEnumMemberIcon Orange
highlight! link AerialStructIcon Blue
highlight! link AerialEventIcon Yellow
highlight! link AerialOperatorIcon Yellow
highlight! link AerialTypeParameterIcon Blue
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
