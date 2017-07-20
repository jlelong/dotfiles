" Deactivates
" let s:loaded_cpp_to_c_comment = 1

if exists("s:loaded_cpp_to_c_comment")
    finish
else
    let s:loaded_backup = 22
endif


function! CPP_to_C_comment () range
    " Converts C++ comments to multiline C style comments
    " // poo
    " becomes
    " /*
    "  * poo
    "  */
    if &foldenable                                                                     
        let foldmethod_save = &foldmethod
        set foldmethod=manual
    endif

    let begin_region  = a:firstline
    let end_region  = a:lastline

    " Loop until all comments are replaced
    while 1
        exe begin_region
        silent! exe '/^\s*\/\/'
        let pos_start = line(".")
        if pos_start > end_region || match (getline("."), '^\s*\/\/') < 0
            break
        endif
        let pos = pos_start
        while match( getline(pos), '^\s*\/\/') >= 0
            let pos = pos + 1
        endwhile

        " Test if comment starts with an empty line
        let pos_end = pos - 1
        if match (getline(pos_start), '^\s*\/\/\s*$') >= 0
            exe pos_start . 's@//@/\*@' 
        else
            exe pos_start
            normal VyP
            exe '.s@//.*$@/\*@' 
            let pos_start = pos_start - 1
            let pos_end = pos_end + 1
            let end_region = end_region + 1
        endif

        " Test if comment ends with an empty line
        if match (getline(pos_end), '^\s*\/\/\s*$') >= 0
            exe pos_end . 's@//@ \*/@' 
        else
            exe pos_end
            normal Vyp
            exe '.s@//.*$@ \*/@' 
            let pos_end = pos_end + 1
            let end_region = end_region + 1
        endif

        let pos_start = pos_start + 1
        let pos_end = pos_end - 1
        exe pos_start . ',' . pos_end . 's@//@ \*@' 
    endwhile

    if &foldenable                                                                     
        " restore folding method
        exe "set foldmethod=".foldmethod_save
    endif
endfunction
