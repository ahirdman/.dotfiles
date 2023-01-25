if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'typescriptreact') ==# -1
    call add(g:sonokai_loaded_file_types, 'typescriptreact')
else
    finish
endif
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
" syn_begin: typescript/typescriptreact {{{
" vim-typescript: https://github.com/leafgarland/typescript-vim{{{
highlight! link typescriptStorageClass Red
highlight! link typescriptEndColons Fg
highlight! link typescriptSource BlueItalic
highlight! link typescriptMessage Green
highlight! link typescriptGlobalObjects BlueItalic
highlight! link typescriptInterpolation Purple
highlight! link typescriptInterpolationDelimiter Purple
highlight! link typescriptBraces Fg
highlight! link typescriptParens Fg
" }}}
" yats: https:github.com/HerringtonDarkholme/yats.vim{{{
highlight! link typescriptMethodAccessor Red
highlight! link typescriptVariable Red
highlight! link typescriptVariableDeclaration Fg
highlight! link typescriptTypeReference BlueItalic
highlight! link typescriptBraces Fg
highlight! link typescriptEnumKeyword Red
highlight! link typescriptEnum BlueItalic
highlight! link typescriptIdentifierName Fg
highlight! link typescriptProp Fg
highlight! link typescriptCall Fg
highlight! link typescriptInterfaceName BlueItalic
highlight! link typescriptEndColons Fg
highlight! link typescriptMember Fg
highlight! link typescriptMemberOptionality Red
highlight! link typescriptObjectLabel Fg
highlight! link typescriptDefaultParam Fg
highlight! link typescriptArrowFunc Red
highlight! link typescriptAbstract Red
highlight! link typescriptObjectColon Grey
highlight! link typescriptTypeAnnotation Grey
highlight! link typescriptAssign Red
highlight! link typescriptBinaryOp Red
highlight! link typescriptUnaryOp Red
highlight! link typescriptFuncComma Fg
highlight! link typescriptClassName BlueItalic
highlight! link typescriptClassHeritage BlueItalic
highlight! link typescriptInterfaceHeritage BlueItalic
highlight! link typescriptIdentifier OrangeItalic
highlight! link typescriptGlobal BlueItalic
highlight! link typescriptOperator Red
highlight! link typescriptNodeGlobal BlueItalic
highlight! link typescriptExport Red
highlight! link typescriptImport Red
highlight! link typescriptTypeParameter BlueItalic
highlight! link typescriptReadonlyModifier Red
highlight! link typescriptAccessibilityModifier Red
highlight! link typescriptAmbientDeclaration Red
highlight! link typescriptTemplateSubstitution Purple
highlight! link typescriptTemplateSB Purple
highlight! link typescriptExceptions Red
highlight! link typescriptCastKeyword Red
highlight! link typescriptOptionalMark Red
highlight! link typescriptNull OrangeItalic
highlight! link typescriptMappedIn Red
highlight! link typescriptFuncTypeArrow Red
highlight! link typescriptTernaryOp Red
highlight! link typescriptParenExp Fg
highlight! link typescriptIndexExpr Fg
highlight! link typescriptDotNotation Grey
highlight! link typescriptGlobalNumberDot Grey
highlight! link typescriptGlobalStringDot Grey
highlight! link typescriptGlobalArrayDot Grey
highlight! link typescriptGlobalObjectDot Grey
highlight! link typescriptGlobalSymbolDot Grey
highlight! link typescriptGlobalMathDot Grey
highlight! link typescriptGlobalDateDot Grey
highlight! link typescriptGlobalJSONDot Grey
highlight! link typescriptGlobalRegExpDot Grey
highlight! link typescriptGlobalPromiseDot Grey
highlight! link typescriptGlobalURLDot Grey
highlight! link typescriptGlobalMethod Green
highlight! link typescriptDOMStorageMethod Green
highlight! link typescriptFileMethod Green
highlight! link typescriptFileReaderMethod Green
highlight! link typescriptFileListMethod Green
highlight! link typescriptBlobMethod Green
highlight! link typescriptURLStaticMethod Green
highlight! link typescriptNumberStaticMethod Green
highlight! link typescriptNumberMethod Green
highlight! link typescriptDOMNodeMethod Green
highlight! link typescriptPaymentMethod Green
highlight! link typescriptPaymentResponseMethod Green
highlight! link typescriptHeadersMethod Green
highlight! link typescriptRequestMethod Green
highlight! link typescriptResponseMethod Green
highlight! link typescriptES6SetMethod Green
highlight! link typescriptReflectMethod Green
highlight! link typescriptBOMWindowMethod Green
highlight! link typescriptGeolocationMethod Green
highlight! link typescriptServiceWorkerMethod Green
highlight! link typescriptCacheMethod Green
highlight! link typescriptES6MapMethod Green
highlight! link typescriptFunctionMethod Green
highlight! link typescriptRegExpMethod Green
highlight! link typescriptXHRMethod Green
highlight! link typescriptBOMNavigatorMethod Green
highlight! link typescriptServiceWorkerMethod Green
highlight! link typescriptIntlMethod Green
highlight! link typescriptDOMEventTargetMethod Green
highlight! link typescriptDOMEventMethod Green
highlight! link typescriptDOMDocMethod Green
highlight! link typescriptStringStaticMethod Green
highlight! link typescriptStringMethod Green
highlight! link typescriptSymbolStaticMethod Green
highlight! link typescriptObjectStaticMethod Green
highlight! link typescriptObjectMethod Green
highlight! link typescriptJSONStaticMethod Green
highlight! link typescriptEncodingMethod Green
highlight! link typescriptBOMLocationMethod Green
highlight! link typescriptPromiseStaticMethod Green
highlight! link typescriptPromiseMethod Green
highlight! link typescriptSubtleCryptoMethod Green
highlight! link typescriptCryptoMethod Green
highlight! link typescriptBOMHistoryMethod Green
highlight! link typescriptDOMFormMethod Green
highlight! link typescriptConsoleMethod Green
highlight! link typescriptDateStaticMethod Green
highlight! link typescriptDateMethod Green
highlight! link typescriptArrayStaticMethod Green
highlight! link typescriptArrayMethod Green
highlight! link typescriptMathStaticMethod Green
highlight! link typescriptStringProperty Fg
highlight! link typescriptDOMStorageProp Fg
highlight! link typescriptFileReaderProp Fg
highlight! link typescriptURLUtilsProp Fg
highlight! link typescriptNumberStaticProp Fg
highlight! link typescriptDOMNodeProp Fg
highlight! link typescriptBOMWindowProp Fg
highlight! link typescriptRequestProp Fg
highlight! link typescriptResponseProp Fg
highlight! link typescriptPaymentProp Fg
highlight! link typescriptPaymentResponseProp Fg
highlight! link typescriptPaymentAddressProp Fg
highlight! link typescriptPaymentShippingOptionProp Fg
highlight! link typescriptES6SetProp Fg
highlight! link typescriptServiceWorkerProp Fg
highlight! link typescriptES6MapProp Fg
highlight! link typescriptRegExpStaticProp Fg
highlight! link typescriptRegExpProp Fg
highlight! link typescriptBOMNavigatorProp Green
highlight! link typescriptXHRProp Fg
highlight! link typescriptDOMEventProp Fg
highlight! link typescriptDOMDocProp Fg
highlight! link typescriptBOMNetworkProp Fg
highlight! link typescriptSymbolStaticProp Fg
highlight! link typescriptEncodingProp Fg
highlight! link typescriptBOMLocationProp Fg
highlight! link typescriptCryptoProp Fg
highlight! link typescriptDOMFormProp Fg
highlight! link typescriptBOMHistoryProp Fg
highlight! link typescriptMathStaticProp Fg
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
