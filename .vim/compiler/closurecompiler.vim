" Vim compiler file
" Compiler:	closure compiler
" URL:		http://vim.wikia.com/wiki/Auto_compile_Javascript_with_Closure

if exists("current_compiler")
  finish
endif
let current_compiler = "closure"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim


CompilerSet makeprg=java\ -jar\ ~/bin/compiler.jar\ --js_output_file=%<.min.js\ --js\ %
CompilerSet errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
