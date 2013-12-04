" function for smart intdenting with tab in insert mode
function InsertTabWrapper()
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
                return "\<tab>"
        else
                return "\<c-p>"
        endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
set formatoptions+=ro
set comments+=:#,:dnl
