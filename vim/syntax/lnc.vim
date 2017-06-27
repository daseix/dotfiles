" Vim syntax file
" Language:	ln_manager configure file
" Maintainer:	seth
" Last Change:	2014-02-06

" quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword	lnConfTodo contained TODO FIXME XXX

syn keyword	lnConfMainKnown contained instance node_map defines process state group push_name_prefix pop_name_prefix process_template pipe_include include hosts network
syn match	lnConfMain "^[a-z_]\+\( \|$\)" contains=lnConfMainKnown nextgroup=lnConfMainParam 
syn match lnConfMainParam ".*$" contained

syn match lnConfVar	"%([^)]\+)" contained 

syn keyword	lnConfKeyKnown contained command environment pass_environment provides node depends_on term_signal change_directory change_dictionary ready_regex members flags gui name manager verbose2_base depends_on_restart term_timeout use_template start_before undef pipe_include include add add_message_definition_dir rk_domain rk_version rk_base rk_name rk_node rk_arguments rk_no_warnings rk_debug rk_use_template enable_auto_groups member_interfaces
syn match	lnConfKey "^[a-z0-9_]\+:"he=e-1 contains=lnConfKeyKnown nextgroup=lnConfSubVarsB,lnConfSubVars,lnConfValue
syn region lnConfSubVarsB start=+ *\[+ skip=+\\\]+ end=+\]+ contained contains=lnConfVar,lnConfSubKey
syn match lnConfSubVars " *[a-zA-Z0-9_()%\$]\+=[^=]*$" contained contains=lnConfVar,lnConfSubKey
syn match lnConfSubKey " *[a-zA-Z0-9_()%\$]\+="he=e-1 contained contains=lnConfVar,lnConfSep
syn match lnConfSep "=" contained
syn match lnConfValue "\s*\([a-zA-Z0-9_()%\$]\+=\)\@![^\[ ]\+.*$" contained contains=lnConfVar

syn match	lnConfComment	"^#.*" contains=lnConfTodo
syn match	lnConfComment	"\s#.*"ms=s+1 contains=lnConfTodo

hi def link lnConfComment	Comment
hi def link lnConfTodo	Todo
"hi def link lnConfSubVarsB	Constant
hi def link lnConfMainKnown Statement
hi def link lnConfMainParam Define
hi def link lnConfKeyKnown	Type
hi def link lnConfVar	Identifier
"hi def link lnConfValue	Constant
hi def link lnConfSep	Operator
hi def link lnConfSubKey Special

let b:current_syntax = "ln_manager_config"

" vim: ts=8 sw=2
