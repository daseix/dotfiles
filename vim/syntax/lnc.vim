" Vim syntax file
" Language:	ln_manager configure file
" Maintainer:	seth
" Last Change:	2014-12-11

" quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn keyword	lnConfTodo contained TODO FIXME XXX

" missing: 'ifdef'
syn keyword	lnConfMainKnown contained include instance node_map process group
syn match	lnConfMain "^[a-z_]\+\( \|$\)" contains=lnConfMainKnown nextgroup=lnConfMainParam 
syn match lnConfMainParam ".*$" contained
syn match lnConfDefines	"^\(defines\|hosts\)\s*\n\(\(.*:.*\|#.*\)\n\)*" contains=lnConfNewKey,lnConfComment nextgroup=lnConfMainKnown
" add ...
syn match lnConfAdd	"^add " nextgroup=lnConfAddKey
" append ...
syn match lnConfAppend	"^append " nextgroup=lnConfAppendKey
" ifdef ...
syn match lnConfCond	"^ifdef " nextgroup=lnConfCondKey
" % ...
syn match lnConfVar	"%([^)]\+)" contained

" mediview_additional_arguments mediview_base mediview_binary mediview_change_directory mediview_derive_from mediview_environment mediview_event_handling_mode mediview_flags mediview_name mediview_node mediview_provides mediview_release_type mediview_release_type_core mediview_sn_csvc_port mediview_start_on_ready mediview_tree mediview_use_template
syn keyword	lnConfKeyKnown contained change_dictionary change_directory command depends_on depends_on_restart derive_from environment flags gui manager members name node pass_environment provides ready_regex term_signal term_timeout verbose2_base use_template start_before description undef pipe_include include add add_message_definition_dir rk_domain rk_version rk_base rk_name rk_node rk_arguments rk_no_warnings rk_debug rk_use_template enable_auto_groups member_interfaces

" append environment
syn match	lnConfAppendKey "\(^append \)\@<=[a-z0-9_]\+ "he=e-1 nextgroup=lnConfEnvKey
" LD_LIBRARY_PATH:
syn match	lnConfEnvKey "\(^append [a-z0-9_]\+ \)\@<=[a-zA-Z0-9_]\+: "he=e-2 nextgroup=lnConfEnvVal,lnConfVar
" ...
syn match	lnConfEnvVal "\(^append [a-z0-9_]\+ [a-zA-Z0-9_]\+: \)\@<=.*$"
" 
syn match	lnConfCondKey "\(^ifdef \)\@<=[a-z0-9_]\+: "he=e-2 nextgroup=lnConfAddKey
syn match	lnConfNewKey "[a-z0-9_]\+:"he=e-1 contained nextgroup=lnConfSubVarsB,lnConfSubVars,lnConfValue
syn match	lnConfAddKey "[a-z0-9_]\+:"he=e-1 nextgroup=lnConfSubVarsB,lnConfSubVars,lnConfValue
syn match	lnConfKey "^[a-z0-9_]\+:"he=e-1 contains=lnConfKeyKnown nextgroup=lnConfSubVarsB,lnConfSubVars,lnConfValue
" [...]
syn region lnConfSubVarsB start=+ *\[+ skip=+\\\]+ end=+\]+ contained contains=lnConfVar,lnConfSubKey
" moep=foo
syn match lnConfSubVars " *[a-zA-Z0-9_()%\$]\+=[^=]*$" contained contains=lnConfVar,lnConfSubKey
" moep=
syn match lnConfSubKey " *[a-zA-Z0-9_()%\$]\+="he=e-1 contained contains=lnConfVar,lnConfSep
" =
syn match lnConfSep "=" contained
" moep=foo
syn match lnConfValue "\s*\([a-zA-Z0-9_()%\$]\+=\)\@![^\[ ]\+.*$" contained contains=lnConfVar

" # comment
syn match	lnConfComment	"^#.*" contains=lnConfTodo
syn match	lnConfComment	"\s#.*"ms=s+1 contains=lnConfTodo

hi def link lnConfComment	Comment
hi def link lnConfTodo	Todo
"hi def link lnConfSubVarsB	Constant
hi def link lnConfMainKnown Statement
hi def link lnConfDefines Statement
hi def link lnConfAdd Statement
hi def link lnConfAppend Statement
hi def link lnConfCond Statement
hi def link lnConfMainParam Define
hi def link lnConfKeyKnown	Type
hi def link lnConfAppendKey	Type
hi def link lnConfCondKey	Type
hi def link lnConfNewKey	Type
hi def link lnConfUnknownKey	Type
hi def link lnConfVar	Identifier
"hi def link lnConfValue	Constant
hi def link lnConfSep	Operator
hi def link lnConfSubKey Special
hi def link lnConfEnvKey Special


let b:current_syntax = "ln_manager_config"

" vim: ts=8 sw=2








"" Vim syntax file
"" Language:	ln_manager configure file
"" Maintainer:	seth
"" Last Change:	2014-02-06

"" quit when a (custom) syntax file was already loaded
"if exists("b:current_syntax")
  "finish
"endif

"syn keyword	lnConfTodo contained TODO FIXME XXX

"syn keyword	lnConfMainKnown contained instance node_map defines process state group push_name_prefix pop_name_prefix process_template pipe_include include hosts network
"syn match	lnConfMain "^[a-z_]\+\( \|$\)" contains=lnConfMainKnown nextgroup=lnConfMainParam 
"syn match lnConfMainParam ".*$" contained

"syn match lnConfVar	"%([^)]\+)" contained 

"syn keyword	lnConfKeyKnown contained command environment pass_environment provides node depends_on term_signal change_directory change_dictionary ready_regex members flags gui name manager verbose2_base depends_on_restart term_timeout use_template start_before description undef pipe_include include add add_message_definition_dir rk_domain rk_version rk_base rk_name rk_node rk_arguments rk_no_warnings rk_debug rk_use_template enable_auto_groups member_interfaces add\senvironment append\senvironment add\sflags
"syn match	lnConfKey "^[a-z0-9_]\+:"he=e-1 contains=lnConfKeyKnown nextgroup=lnConfSubVarsB,lnConfSubVars,lnConfValue
"syn region lnConfSubVarsB start=+ *\[+ skip=+\\\]+ end=+\]+ contained contains=lnConfVar,lnConfSubKey
"syn match lnConfSubVars " *[a-zA-Z0-9_()%\$]\+=[^=]*$" contained contains=lnConfVar,lnConfSubKey
"syn match lnConfSubKey " *[a-zA-Z0-9_()%\$]\+="he=e-1 contained contains=lnConfVar,lnConfSep
"syn match lnConfSep "=" contained
"syn match lnConfValue "\s*\([a-zA-Z0-9_()%\$]\+=\)\@![^\[ ]\+.*$" contained contains=lnConfVar

"syn match	lnConfComment	"^#.*" contains=lnConfTodo
"syn match	lnConfComment	"\s#.*"ms=s+1 contains=lnConfTodo

"hi def link lnConfComment	Comment
"hi def link lnConfTodo	Todo
""hi def link lnConfSubVarsB	Constant
"hi def link lnConfMainKnown Statement
"hi def link lnConfMainParam Define
"hi def link lnConfKeyKnown	Type
"hi def link lnConfVar	Identifier
""hi def link lnConfValue	Constant
"hi def link lnConfSep	Operator
"hi def link lnConfSubKey Special

"let b:current_syntax = "ln_manager_config"

"" vim: ts=8 sw=2
