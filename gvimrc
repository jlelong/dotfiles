set gfn=Monaco:h11 " this font has no bold version !
" set guifont=Menlo\ Regular:h12
set columns=110
set lines=55
set go-=T "Remove toolbar
set go+=c "use console dialog box instead of gui
set background=dark
set visualbell
colorscheme macvim
hi Normal guifg=grey70 guibg=#002F3B
" hi Normal guifg=grey70 guibg=grey18 
hi Statement   gui=bold guifg=orange4
hi Special gui=bold guifg=#DC4C4C
hi clear Visual
hi Visual guifg=black guibg=grey70
hi Pmenu guifg=black
hi clear Folded 
hi Folded gui=standout 
hi clear Search
hi Search gui=reverse
hi clear Cursor 
hi Cursor gui=reverse
hi Directory guifg=#266EB5
hi SpecialKey guifg=#266EB5
hi LineNr guibg=bg guifg=grey33
" hi Identifier guifg=cyan3
" hi Boolean guifg=Pink
hi CursorLine guibg=grey5
hi PreProc guibg=bg
