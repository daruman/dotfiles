" Vim compiler file
" Compiler:	sass
" URL:		https://gist.github.com/890930/fc595877c06bcbb78818880f97caa7af84593331
"
if exists("current_compiler")
  finish
endif
let current_compiler = "sass_scss"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=sass\ -t\ compressed\ --trace\ --unix-newlines\ --scss\ %\ %:s?\.scss$?.css?

CompilerSet errorformat=
        \%f:%l:%m\ (Sass::SyntaxError),
        \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save
