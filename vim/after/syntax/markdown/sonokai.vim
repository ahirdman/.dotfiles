if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'markdown') ==# -1
    call add(g:sonokai_loaded_file_types, 'markdown')
else
    finish
endif
let s:configuration = sonokai#get_configuration()
let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)
" syn_begin: markdown {{{
" builtin: {{{
call sonokai#highlight('markdownH1', s:palette.red, s:palette.none, 'bold')
call sonokai#highlight('markdownH2', s:palette.orange, s:palette.none, 'bold')
call sonokai#highlight('markdownH3', s:palette.yellow, s:palette.none, 'bold')
call sonokai#highlight('markdownH4', s:palette.green, s:palette.none, 'bold')
call sonokai#highlight('markdownH5', s:palette.blue, s:palette.none, 'bold')
call sonokai#highlight('markdownH6', s:palette.purple, s:palette.none, 'bold')
call sonokai#highlight('markdownUrl', s:palette.blue, s:palette.none, 'underline')
call sonokai#highlight('markdownItalic', s:palette.none, s:palette.none, 'italic')
call sonokai#highlight('markdownBold', s:palette.none, s:palette.none, 'bold')
call sonokai#highlight('markdownItalicDelimiter', s:palette.grey, s:palette.none, 'italic')
highlight! link markdownCode Green
highlight! link markdownCodeBlock Green
highlight! link markdownCodeDelimiter Green
highlight! link markdownBlockquote Grey
highlight! link markdownListMarker Red
highlight! link markdownOrderedListMarker Red
highlight! link markdownRule Purple
highlight! link markdownHeadingRule Grey
highlight! link markdownUrlDelimiter Grey
highlight! link markdownLinkDelimiter Grey
highlight! link markdownLinkTextDelimiter Grey
highlight! link markdownHeadingDelimiter Grey
highlight! link markdownLinkText Red
highlight! link markdownUrlTitleDelimiter Green
highlight! link markdownIdDeclaration markdownLinkText
highlight! link markdownBoldDelimiter Grey
highlight! link markdownId Yellow
" }}}
" vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
call sonokai#highlight('mkdURL', s:palette.blue, s:palette.none, 'underline')
call sonokai#highlight('mkdInlineURL', s:palette.blue, s:palette.none, 'underline')
call sonokai#highlight('mkdItalic', s:palette.grey, s:palette.none, 'italic')
highlight! link mkdCodeDelimiter Green
highlight! link mkdBold Grey
highlight! link mkdLink Red
highlight! link mkdHeading Grey
highlight! link mkdListItem Red
highlight! link mkdRule Purple
highlight! link mkdDelimiter Grey
highlight! link mkdId Yellow
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
let s:configuration = sonokai#get_configuration()
let s:palette = sonokai#get_palette(s:configuration.style, s:configuration.colors_override)
" syn_begin: html/markdown/javascriptreact/typescriptreact {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax{{{
call sonokai#highlight('htmlH1', s:palette.red, s:palette.none, 'bold')
call sonokai#highlight('htmlH2', s:palette.orange, s:palette.none, 'bold')
call sonokai#highlight('htmlH3', s:palette.yellow, s:palette.none, 'bold')
call sonokai#highlight('htmlH4', s:palette.green, s:palette.none, 'bold')
call sonokai#highlight('htmlH5', s:palette.blue, s:palette.none, 'bold')
call sonokai#highlight('htmlH6', s:palette.purple, s:palette.none, 'bold')
call sonokai#highlight('htmlLink', s:palette.none, s:palette.none, 'underline')
call sonokai#highlight('htmlBold', s:palette.none, s:palette.none, 'bold')
call sonokai#highlight('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call sonokai#highlight('htmlBoldItalic', s:palette.none, s:palette.none, 'bold,italic')
call sonokai#highlight('htmlBoldUnderlineItalic', s:palette.none, s:palette.none, 'bold,underline,italic')
call sonokai#highlight('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call sonokai#highlight('htmlUnderlineItalic', s:palette.none, s:palette.none, 'underline,italic')
call sonokai#highlight('htmlItalic', s:palette.none, s:palette.none, 'italic')
highlight! link htmlTag Green
highlight! link htmlEndTag Blue
highlight! link htmlTagN RedItalic
highlight! link htmlTagName RedItalic
highlight! link htmlArg Blue
highlight! link htmlScriptTag Purple
highlight! link htmlSpecialTagName RedItalic
highlight! link htmlString Green
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
