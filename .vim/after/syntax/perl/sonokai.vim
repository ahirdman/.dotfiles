if !exists('g:colors_name') || g:colors_name !=# 'sonokai'
    finish
endif
if index(g:sonokai_loaded_file_types, 'perl') ==# -1
    call add(g:sonokai_loaded_file_types, 'perl')
else
    finish
endif
" syn_begin: perl/pod {{{
" builtin: https://github.com/vim-perl/vim-perl{{{
highlight! link perlStatementPackage Red
highlight! link perlStatementInclude Red
highlight! link perlStatementStorage Red
highlight! link perlStatementList Red
highlight! link perlMatchStartEnd Red
highlight! link perlVarSimpleMemberName Green
highlight! link perlVarSimpleMember Fg
highlight! link perlMethod Green
highlight! link podVerbatimLine Green
highlight! link podCmdText Yellow
highlight! link perlVarPlain Fg
highlight! link perlVarPlain2 Fg
" }}}
" syn_end
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
