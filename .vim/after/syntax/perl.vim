" insert tab in the beginning, or keyword-completion in case of words
" map this function to tab in insert mode
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" map Shift-tab to insert real tab
set tw=76
set tags+=../TAGS
" note that formatoptions must contain ro to autostart // comments
set formatoptions=cqroa1
set cinoptions=g0:0t0c2C1(0f0l1
set cindent 
