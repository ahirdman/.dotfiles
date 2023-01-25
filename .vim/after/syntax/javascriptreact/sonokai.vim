if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'javascriptreact') ==# -1
    call add(g:sonokai_loaded_file_types, 'javascriptreact')
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
" syn_begin: javascript/javascriptreact {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
highlight! link javaScriptNull OrangeItalic
highlight! link javaScriptIdentifier BlueItalic
highlight! link javaScriptParens Fg
highlight! link javaScriptBraces Fg
highlight! link javaScriptNumber Purple
highlight! link javaScriptLabel Red
highlight! link javaScriptGlobal BlueItalic
highlight! link javaScriptMessage BlueItalic
" }}}
" vim-javascript: https://github.com/pangloss/vim-javascript{{{
highlight! link jsNoise Fg
highlight! link Noise Fg
highlight! link jsParens Fg
highlight! link jsBrackets Fg
highlight! link jsObjectBraces Fg
highlight! link jsThis BlueItalic
highlight! link jsUndefined OrangeItalic
highlight! link jsNull OrangeItalic
highlight! link jsNan OrangeItalic
highlight! link jsSuper OrangeItalic
highlight! link jsPrototype OrangeItalic
highlight! link jsFunction Red
highlight! link jsGlobalNodeObjects BlueItalic
highlight! link jsGlobalObjects BlueItalic
highlight! link jsArrowFunction Red
highlight! link jsArrowFuncArgs Fg
highlight! link jsFuncArgs Fg
highlight! link jsObjectProp Fg
highlight! link jsVariableDef Fg
highlight! link jsObjectKey Fg
highlight! link jsParen Fg
highlight! link jsParenIfElse Fg
highlight! link jsParenRepeat Fg
highlight! link jsParenSwitch Fg
highlight! link jsParenCatch Fg
highlight! link jsBracket Fg
highlight! link jsObjectValue Fg
highlight! link jsDestructuringBlock Fg
highlight! link jsBlockLabel Purple
highlight! link jsFunctionKey Green
highlight! link jsClassDefinition BlueItalic
highlight! link jsDot Grey
highlight! link jsSpreadExpression Purple
highlight! link jsSpreadOperator Green
highlight! link jsModuleKeyword BlueItalic
highlight! link jsTemplateExpression Purple
highlight! link jsTemplateBraces Purple
highlight! link jsClassMethodType BlueItalic
highlight! link jsExceptions BlueItalic
" }}}
" yajs: https://github.com/othree/yajs.vim{{{
highlight! link javascriptOpSymbol Red
highlight! link javascriptOpSymbols Red
highlight! link javascriptIdentifierName Fg
highlight! link javascriptVariable BlueItalic
highlight! link javascriptObjectLabel Fg
highlight! link javascriptPropertyNameString Fg
highlight! link javascriptFuncArg Fg
highlight! link javascriptObjectLiteral Green
highlight! link javascriptIdentifier OrangeItalic
highlight! link javascriptArrowFunc Red
highlight! link javascriptTemplate Purple
highlight! link javascriptTemplateSubstitution Purple
highlight! link javascriptTemplateSB Purple
highlight! link javascriptNodeGlobal BlueItalic
highlight! link javascriptDocTags RedItalic
highlight! link javascriptDocNotation Blue
highlight! link javascriptClassSuper OrangeItalic
highlight! link javascriptClassName BlueItalic
highlight! link javascriptClassSuperName BlueItalic
highlight! link javascriptOperator Red
highlight! link javascriptBrackets Fg
highlight! link javascriptBraces Fg
highlight! link javascriptLabel Purple
highlight! link javascriptEndColons Grey
highlight! link javascriptObjectLabelColon Grey
highlight! link javascriptDotNotation Grey
highlight! link javascriptGlobalArrayDot Grey
highlight! link javascriptGlobalBigIntDot Grey
highlight! link javascriptGlobalDateDot Grey
highlight! link javascriptGlobalJSONDot Grey
highlight! link javascriptGlobalMathDot Grey
highlight! link javascriptGlobalNumberDot Grey
highlight! link javascriptGlobalObjectDot Grey
highlight! link javascriptGlobalPromiseDot Grey
highlight! link javascriptGlobalRegExpDot Grey
highlight! link javascriptGlobalStringDot Grey
highlight! link javascriptGlobalSymbolDot Grey
highlight! link javascriptGlobalURLDot Grey
highlight! link javascriptMethod Green
highlight! link javascriptMethodName Green
highlight! link javascriptObjectMethodName Green
highlight! link javascriptGlobalMethod Green
highlight! link javascriptDOMStorageMethod Green
highlight! link javascriptFileMethod Green
highlight! link javascriptFileReaderMethod Green
highlight! link javascriptFileListMethod Green
highlight! link javascriptBlobMethod Green
highlight! link javascriptURLStaticMethod Green
highlight! link javascriptNumberStaticMethod Green
highlight! link javascriptNumberMethod Green
highlight! link javascriptDOMNodeMethod Green
highlight! link javascriptES6BigIntStaticMethod Green
highlight! link javascriptBOMWindowMethod Green
highlight! link javascriptHeadersMethod Green
highlight! link javascriptRequestMethod Green
highlight! link javascriptResponseMethod Green
highlight! link javascriptES6SetMethod Green
highlight! link javascriptReflectMethod Green
highlight! link javascriptPaymentMethod Green
highlight! link javascriptPaymentResponseMethod Green
highlight! link javascriptTypedArrayStaticMethod Green
highlight! link javascriptGeolocationMethod Green
highlight! link javascriptES6MapMethod Green
highlight! link javascriptServiceWorkerMethod Green
highlight! link javascriptCacheMethod Green
highlight! link javascriptFunctionMethod Green
highlight! link javascriptXHRMethod Green
highlight! link javascriptBOMNavigatorMethod Green
highlight! link javascriptServiceWorkerMethod Green
highlight! link javascriptDOMEventTargetMethod Green
highlight! link javascriptDOMEventMethod Green
highlight! link javascriptIntlMethod Green
highlight! link javascriptDOMDocMethod Green
highlight! link javascriptStringStaticMethod Green
highlight! link javascriptStringMethod Green
highlight! link javascriptSymbolStaticMethod Green
highlight! link javascriptRegExpMethod Green
highlight! link javascriptObjectStaticMethod Green
highlight! link javascriptObjectMethod Green
highlight! link javascriptBOMLocationMethod Green
highlight! link javascriptJSONStaticMethod Green
highlight! link javascriptGeneratorMethod Green
highlight! link javascriptEncodingMethod Green
highlight! link javascriptPromiseStaticMethod Green
highlight! link javascriptPromiseMethod Green
highlight! link javascriptBOMHistoryMethod Green
highlight! link javascriptDOMFormMethod Green
highlight! link javascriptClipboardMethod Green
highlight! link javascriptTypedArrayStaticMethod Green
highlight! link javascriptBroadcastMethod Green
highlight! link javascriptDateStaticMethod Green
highlight! link javascriptDateMethod Green
highlight! link javascriptConsoleMethod Green
highlight! link javascriptArrayStaticMethod Green
highlight! link javascriptArrayMethod Green
highlight! link javascriptMathStaticMethod Green
highlight! link javascriptSubtleCryptoMethod Green
highlight! link javascriptCryptoMethod Green
highlight! link javascriptProp Fg
highlight! link javascriptBOMWindowProp Fg
highlight! link javascriptDOMStorageProp Fg
highlight! link javascriptFileReaderProp Fg
highlight! link javascriptURLUtilsProp Fg
highlight! link javascriptNumberStaticProp Fg
highlight! link javascriptDOMNodeProp Fg
highlight! link javascriptRequestProp Fg
highlight! link javascriptResponseProp Fg
highlight! link javascriptES6SetProp Fg
highlight! link javascriptPaymentProp Fg
highlight! link javascriptPaymentResponseProp Fg
highlight! link javascriptPaymentAddressProp Fg
highlight! link javascriptPaymentShippingOptionProp Fg
highlight! link javascriptTypedArrayStaticProp Fg
highlight! link javascriptServiceWorkerProp Fg
highlight! link javascriptES6MapProp Fg
highlight! link javascriptRegExpStaticProp Fg
highlight! link javascriptRegExpProp Fg
highlight! link javascriptXHRProp Fg
highlight! link javascriptBOMNavigatorProp Green
highlight! link javascriptDOMEventProp Fg
highlight! link javascriptBOMNetworkProp Fg
highlight! link javascriptDOMDocProp Fg
highlight! link javascriptSymbolStaticProp Fg
highlight! link javascriptSymbolProp Fg
highlight! link javascriptBOMLocationProp Fg
highlight! link javascriptEncodingProp Fg
highlight! link javascriptCryptoProp Fg
highlight! link javascriptBOMHistoryProp Fg
highlight! link javascriptDOMFormProp Fg
highlight! link javascriptDataViewProp Fg
highlight! link javascriptBroadcastProp Fg
highlight! link javascriptMathStaticProp Fg
" }}}
" vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty{{{
highlight! link jsxTagName RedItalic
highlight! link jsxOpenPunct Green
highlight! link jsxClosePunct Blue
highlight! link jsxEscapeJs Purple
highlight! link jsxAttrib Blue
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
