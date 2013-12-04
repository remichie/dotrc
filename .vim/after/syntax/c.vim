set spell
" set foldmethod=syntax
" insert tab in the beginning, or keyword-completion in case of words
" map this function to tab in insert mode
set completeopt=menu
set pumheight=4
set noet
set ts=8
set sts=8
set sw=8

" map Shift-tab to insert real tab
inoremap <S-tab> <c-r>=InsertShiftTabWrapper()<cr>
" tab in command mode switches between header and body
nmap <tab> :call AlternateFile("t")<CR>
nmap <F9> :make %<.o<CR>:cwindow<CR>
nmap <F10> :make<CR>
nmap <F12> :make %:r<CR>
set tw=66
" note that formatoptions must contain ro to autostart // comments
set formatoptions=cqn1
set cinoptions=g0:0t0c2C1(0f0l1
set cindent 
set indentexpr=MyCxxIndent()
set indentkeys+==*/
set foldmethod=marker

" my indentation:

if exists("*MyFormatComment") || exists("*MyCxxIndent") || exists("*MyInsertShiftTabWrapper")
  finish
endif

function MyFormatComment()
  let line = getline(".")
  if line =~ '\S\+\s\+\/\/'
    let code = substitute(line, '\(\S\+\)\s\+\/\/.*$', '\1', '')
    let comment = strpart(line, stridx(line, '//'))
    let code_len = strlen(code)
    let comment_len = strlen(comment)
    if code_len + comment_len < &textwidth
      let line = code
      if code_len < 48 
        let num_spaces = comment_len + 48 < &textwidth ? 48 - code_len : &textwidth - code_len - comment_len
        while num_spaces > 0 
          let line = line.' '
          let num_spaces = num_spaces - 1
        endwhile
        let line = line.comment
      else
        let line = line.' '.comment
      endif
      call setline(".", line)
    endif
  endif
endfunction

" so as indent function can not change anything, add a mapping for formatting 
" command -range MyComment |<line1>,<line2> :call MyFormatComment()|

function MyCxxIndent()
  return getline(v:lnum) =~ '^\s*\*\/$' ? cindent(v:lnum-1) - &sw : cindent(v:lnum)
endfunction

function InsertShiftTabWrapper()
  let num_spaces = 48 - virtcol('.')
  let line = ' '
  while (num_spaces > 0)
    let line = line . ' '
    let num_spaces = num_spaces - 1
  endwhile
  return line
endfunction
syn keyword cConstant TRUE FALSE
function InsertTabWrapper()
	let col = col('.') - 1
	let prev_char = getline('.')[col-1]
	if pumvisible()
		let cmd = "\<C-N>"
	elseif !col
		let cmd = "\<tab>"
	elseif  prev_char == '(' 
		let cmd = CodeComplete()
	elseif  prev_char == ')' 
		let cmd = SwitchRegion() . SwitchRegion()
	elseif  prev_char == ',' 
		let cmd = SwitchRegion()
	elseif prev_char !~ '\k'
		let cmd = "\<tab>"
	else
		let cmd = "\<C-X>\<C-N>"
	endif
	return cmd
endfunction
let OmniCpp_ShowScopeInAbbr=1
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
set completeopt="menu"
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
