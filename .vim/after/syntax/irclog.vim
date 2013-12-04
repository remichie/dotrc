
if exists('b:current_syntax')
  finish
endif
let b:current_syntax = 'irclog'


syn match timestamp "^\[\d\d\-\d\d\-\d\d\/\d\d:\d\d\]"
"syn match nick      "^\(\[.\+\]\) <\S\+>"hs=s+1,he=e-1
"syn match said      "\(^\d\d:\d\d:\d\d <\S\+>\s\+\)\@<=.*"
"syn match said      "\(^ \{12,}\)\@<=.*"

hi link timestamp Constant
"hi link nick      Identifier
"hi link said      Comment

