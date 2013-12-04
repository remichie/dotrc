" Vim syntax file
" Language:     generic ChangeLog file
" Written By:   Gediminas Paulauskas <menesis@delfi.lt>
" Maintainer:   Corinna Vinschen <vinschen@redhat.com>
" Last Change:  Sep 3, 2001
set spell

" For version 6.x: Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match       todoText        "^.*$" contains=todoBullet,todoMail,todoNumber,todoKeyword,todoComment
syn match       todoComment                     "#.*$"
syn match       todoBullet      contained "^\s\+[+*-]\s"
syn match       todoMail        contained "<[A-Za-z0-9\._:+-]\+@[A-Za-z0-9\._-]\+>"
syn keyword     todoKeyword     contained TODO DONE TESTS FROZEN TASK
syn keyword     todoKeyword     contained DESCRIPTION READING
syn keyword     todoKeyword     contained TASKS KEY ACTIVITIES MAJOR MINOR
syn keyword     todoKeyword     contained LAST WEEK VIBRATIONS GOOD
syn keyword     todoKeyword     contained CONCERNS ACCOMPLISHMENTS
syn keyword     todoKeyword     contained THAT FOR STALLED
syn keyword     todoKeyword     contained HOURS WORKED WAITING

command -nargs=+ HiLink hi def link <args>

HiLink todoBullet       Type
HiLink todoHeader       Statement
HiLink todoMail         Special
HiLink todoKeyword      Number
HiLink todoComment      Comment

delcommand HiLink

let b:current_syntax = "todo"

" vim: ts=8

