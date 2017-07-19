" Jerome Lelong <jerome.lelong@gmail.com>


let g:yankring_history_dir='$HOME/.vim'
let g:yankring_replace_n_pkey = '<C-y>'
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'"
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'vim-latex/vim-latex'
Plugin 'vim-syntastic/syntastic' "For js install jshint using npm
Plugin 'python-mode/python-mode'
Plugin 'majutsushi/tagbar'
Plugin 'Chiel92/vim-autoformat'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'vim-scripts/tComment'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'richq/vim-cmake-completion'
Plugin 'Valloric/MatchTagAlways'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'dhruvasagar/vim-table-mode'
call vundle#end()            " required"

filetype plugin indent on 
syntax on
" Enable local vimrc
set exrc

" runtime '/Users/jl/.vim/ftplugin/octave.vim'

" Visual effects {{{
if has("gui_running")
    " Gui stuff goes to .gvimrc
else
    set t_Co=256
    set background=dark
    colorscheme slate
    hi Visual ctermbg=3 cterm=NONE 
endif
hi clear Cursorline
hi CursorLine ctermbg=233
" Clear highlighting for spelling
hi clear SpellBad 
hi clear SpellCap 
hi clear SpellLocal 
hi clear SpellRare
hi SpellBad cterm=underline ctermfg=2 gui=underline guifg=red
hi PmenuSel ctermbg=black ctermfg=white  guibg=black guifg=white
"" Dark background stuff
hi clear Visual 
hi Visual cterm=reverse gui=reverse
hi Pmenu ctermfg=black guifg=black
hi clear Folded 
hi Folded cterm=standout ctermfg=242
hi clear Search
hi Search cterm=reverse gui=reverse
hi DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
hi Comment cterm=NONE ctermfg=DarkGrey
hi clear MatchParen
hi MatchParen cterm=reverse
" }}}

" Some keybindings and commands {{{
" Deactivate <F1> because <Esc> is to tiny
let mapleader=","
let maplocalleader=","
set pastetoggle=<F4>
map <F1> <Esc>
imap <F1> <Esc>
nmap <S-Left> <Esc>:bp<CR>
nmap <S-Right> <Esc>:bn<CR>
nmap <S-H> <Esc>:bp<CR>
nmap <S-L> <Esc>:bn<CR>
nmap <C-S-Left> <Esc>:tabprev<CR>
nmap <C-S-Right> <Esc>:tabnext<CR>
nmap <C-S-H> <Esc>:tabprev<CR>
nmap <C-S-L> <Esc>:tabnext<CR>
nmap  <Tab> <C-W>W
" nnoremap  <space> <Esc>gEldwi <Esc>
nmap <S-F6> <Esc>:cnext!<CR>
nmap <Leader>cc <Esc>:w<CR>:make<CR>
nmap <Leader>cn <Esc>:cnext!<CR>
nmap <Leader>cp <Esc>:cprev!<CR>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <Leader>qq gwap
vnoremap <Leader>qq gw
command -range=% -nargs=* Tidy <line1>,<line2>! perltidy  <args>
command -range=% -nargs=* Cindent call Astyle()
command -range=% -nargs=* AddSpaceEqual %s/\([^+*\/ -]\)=\([^+*\/ -]\)/\1 = \2/g
noremap <S-F12> :TagbarToggle<CR> 
noremap <F11> :NERDTreeToggle<CR> 

" Auto Pairs stuff
let g:AutoPairsShortcutToggle="<F2>"
let g:AutoPairsShortcutFastWrap="<S-F2>"
let g:AutoPairsMapBS=0
let g:AutoPairsMapSpace=0
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''
" }}}

" General Options {{{
set hidden
set novb
set t_vb=
set mouse=a
if has('mouse_sgr')
    set ttymouse=sgr
endif
set wildignore =*.o,*.so,*.sl,*.tar,*.tgz,*~
set iskeyword+=_ " underscore as word delimiter
set isfname-=,
set isfname-==
set autoread<  "auto reload modified buffer
set ts=4 sw=4  sts=4
set expandtab
set listchars=tab:>-,trail:¶
set indentkeys+=*Return
set syntax=whitespace
set fileformat=unix
set autoindent
set smartindent
set nocindent
set sidescroll=10
set incsearch smartcase
set autoread
set backup
set backupcopy=yes
set writebackup
set foldminlines=2
set foldmethod=syntax
let r_syntax_folding=1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_left=1
let NERDTreeWinPos="left"
let g:pymode_rope_completion=0
let g:syntastic_mode_map={'mode': 'passive', 'active_filetypes': ['python', 'perl', 'php','javascript']}
let g:syntastic_perl_checkers = ['perlcritic']
let g:syntastic_enable_perl_checker = 1
let g:pymode_lint_ignore="E501,C901,E402"
let g:pymode_lint_config = '$HOME/.pylint.rc'
let g:plaintex_delimiters=1
let g:formatprg_args_expr_c='"--style=gnu -pHUs".&shiftwidth'
let g:formatprg_args_expr_cpp='"--style=gnu -pHUSk3W3s".&shiftwidth'
let g:vimrplugin_assign_map='--'
" }}}

" Appearance properties {{{
set ruler " Affiche la position du curseur 'ligne,colonne'
set laststatus=2
set statusline=%<%.60F%h%m%r%=%{\"[\".(&fileformat).\",\".(&fenc==\"\"?&enc:&fenc).\",sw=\".(&sw).\",ts=\".(&ts).\",sts=\".(&sts).\"]\"}%y\ %l,%c\ %P " Contenu de la barre de status
set nonu
" set showtabline=2
set modeline
set modelines=5
set history=300
set viminfo='50,<50
set backspace=2 " Active la touche Backspace
set whichwrap=<,>,[,]
set scrolloff=4
set showcmd " Affiche les commandes dans la barre de status
set showmatch " Affiche la paire de parenthèses
set wildmode =longest:list    "affiche toutes les possibilités
set wildmenu   "affiche le menu
set completeopt=longest,menuone,menu,preview
set cursorline
set nostartofline " Garde le curseur dans la même colonne quand on change de ligne
" }}}

" Wrapping text
set textwidth=75
set wrap


" Auto commands {{{
" Set some buffers not to be listed
autocmd FileType qf setlocal nobuflisted
autocmd BufNewFile,BufRead {*.log}  setlocal nobuflisted

autocmd BufNewfile,BufRead *.[chCH] call JL_C ()
autocmd BufNewfile,BufRead *.[ch] setlocal filetype=c
" autocmd BufNewfile,BufRead *.[CH] setlocal filetype=cpp
autocmd BufNewfile,BufRead *.{cpp,tpp,txx,cxx,h,hpp} call JL_C ()
autocmd BufNewfile,BufRead *.{cpp,tpp,txx,cxx} setlocal filetype=cpp
autocmd BufNewfile,BufRead *.sh setlocal ts=4 sw=4 wrap formatoptions-=t
autocmd BufNewfile,BufRead [mM]akefile* setlocal ts=4 sw=4 noexpandtab list
autocmd BufNewfile,BufRead *.tex call JL_tex()
autocmd BufNewfile,BufRead *.sc[ie] setlocal syntax=scilab sw=4 ts=4 formatoptions-=t omnifunc=syntaxcomplete#Complete
autocmd BufNewfile,BufRead *.m setlocal filetype=octave sw=4 ts=4 formatoptions-=t omnifunc=syntaxcomplete#Complete
autocmd BufNewfile,BufRead *.m nnoremap <buffer> <F5> :OctaveHelp <C-R><C-W><CR>
autocmd BufNewfile,BufRead *.{html,php} setlocal sw=2 ts=2 sts=2 foldmethod=indent tw=0
autocmd BufNewfile,BufRead *.js setlocal sw=4 ts=4 sts=4 tw=0
autocmd BufNewfile,BufRead *.org setlocal nowrap sw=4 ts=4 sts=4 tw=0
autocmd BufNewfile,BufRead *.pl call JL_Perl()
autocmd BufNewfile,BufRead *.py setlocal ts=4 sw=4 formatoptions-=t tw=0 expandtab nonu list nosmartindent
autocmd BufNewfile,BufRead {TODO,README,TIPS,*.txt,*.dat} setlocal ft=txt sw=4 ts=4 tw=72
autocmd BufNewfile,BufRead svn-commit.tmp setlocal sw=4 ts=4 tw=70 fenc=utf-8
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setlocal ft=cmake tw=0
autocmd BufRead,BufNewFile *.ctest,*.ctest.in setlocal ft=cmake
autocmd BufRead,BufNewFile *.m4,configure.{in,ac} setlocal sw=4 ts=4 sts=4 nowrap
autocmd BufRead,BufNewFile *.conf setlocal sw=4 ts=4 sts=4 ft=txt
autocmd BufRead,BufNewFile *.{sty,cls} setlocal sw=2 ts=2 sts=2 ft=plaintex
autocmd BufRead,BufNewFile *.txt setlocal sw=4 ts=4 sts=4 nocindent
autocmd BufRead,BufNewFile /usr/include/c++/** setlocal filetype=cpp
autocmd BufRead,BufNewFile /usr/local/include/boost/** setlocal filetype=cpp
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" }}}

" C stuff {{{
function! JL_C ()
    " " errorformat for gcc
    setlocal errorformat=%f:%l:%c:\ %m,%f:%l:\ %m
    " errorformat for clang
    " setlocal errorformat=%f:%l:%c:\ %m
    setlocal expandtab
    setlocal list

    setlocal cinkeys+=;
    setlocal cinkeys+=*<Return>
    " set cinoptions={1s,>1s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s
    " setlocal cinoptions={.5s,:.5s,+.5s,t0,g0,^-2,e-2,n-2,p2s,(0,=.5s,h.5s,i.5s,c0 
    " setlocal cinoptions={.5s,:1s,+1s,t0,g0,e-1s,n-1s,p2s,(0,=1s,h1s,i1s,c0 
    " Set various width parameters
    setlocal sw=2 ts=8 tw=100
    setlocal cinoptions=>2s,e-s,n-s,f0,{s,^-s,:s,=s,g0,+.5s,p2s,t0,(0
    setlocal cindent
    " Set 'formatoptions' to break comment lines but not other lines,
    " and insert the comment leader when hitting <CR> or using "o".
    setlocal fo-=t fo+=croqlj
    
    " Set 'comments' to format dashed lists in comments.
    setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
    set cpo-=C

    "Select a function code
    noremap <buffer> <C-h> <Esc>?^{<CR>?^\s*$<CR>jV/^{<CR>%<CR> 
    setlocal makeprg=make    
    setlocal ts=4 sw=2 softtabstop=2
    nnoremap <buffer> <F6> <Esc>:w<CR>:make
    nnoremap <buffer> <F8> <Esc>:Dox<CR>
    nnoremap <buffer> <F9> <C-w>] 
    noremap <buffer> <F10> <C-t>
    nnoremap <buffer> <F5> :Man <C-R><C-W><CR>
    " Cscope mappings
	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nnoremap <buffer> <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <buffer> <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nnoremap <buffer> <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nnoremap <buffer> <C-_><C-_>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_><C-_>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_><C-_>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_><C-_>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_><C-_>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_><C-_>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nnoremap <buffer> <C-_><C-_>d :scs find d <C-R>=expand("<cword>")<CR><CR>

endfunction

" Disable auto popup, use <Tab> to autocomplete
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 0
let g:clang_use_library = 1
let g:clang_debug = 1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = '<F12>'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'tex' : 1,
      \ 'plaintex' : 1,
      \ 'javascript' : 1
      \}

let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_compactOneLineDoc="yes"

function! s:insert_gates()
    let gatename = "_" . substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal! i#ifndef " . gatename
    execute "normal! o#define " . gatename . " "
    execute "normal! Go#endif /* " . gatename . " */"
    execute "normal! O"
    execute "normal! O"
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

let g:astyle_args_gnu="--style=gnu -p -k3 -H -U -s2"
let g:astyle_args_bsd="-A1 -p -k3 -H -U -s4"
let g:astyle_args=g:astyle_args_gnu
function! Astyle()
    let l:pos = getpos(".")
    execute "%! astyle " .  g:astyle_args
    call setpos(".", pos)
endfunction

function! JLStyle()
    echo "Choose your Style\n\r1. GNU\n\r2. BSD\n"
    call inputsave()
    let l:choice = input('Your choice: ')
    call inputrestore()
    if l:choice == 1
        let g:astyle_args=g:astyle_args_gnu
        setlocal sw=2 ts=4 sts=4
        setlocal cinoptions=>2s,e-s,n-s,f0,{s,^-s,:s,=s,g0,+.5s,p2s,t0,(0
    elseif l:choice == 2
        let g:astyle_args=g:astyle_args_bsd
        setlocal sw=4 ts=4 sts=4
        setlocal cinoptions=>s,f0,:0,=s,g0,+s,p2s,t0,(0,N-s
    endif
endfunction


"Insert copyrights
command! -nargs=0 JLlgpl :0r ~/.vim/templates/lgpl.tmpl
command! -nargs=0 JLgpl :0r ~/.vim/templates/gpl.tmpl
" }}}

" Format text {{{
" Clean  code
function! JL_Clean_code ()
    let l:pos = getpos(".")
    %retab
    %s///ge
    %s/[ \t]*$//ge
    call setpos(".", l:pos)
    echo "Code cleaned"
endfunction
" }}}

"LaTeX stuff {{{

" Declare a frame as fragile
function! JL_Tex_add_fragile ()
    let l:pos = getpos(".")
    if search( '\\begin{frame}', "b")
        let l:line = getline(".")
        if l:line !~ '\[fragile\]' 
            let l:line =  substitute(l:line, '\\begin{frame}\(\[.*\]\)*', '\\begin{frame}\[fragile\]', 'e')
            call setline(".",l:line)
        endif
    endif
    call setpos(".", l:pos)
endfunction


function! JL_tex ()
    setlocal ts=2 sw=2 softtabstop=2 tw=90
    setlocal expandtab
    setlocal iskeyword+=:,-,_
    noremap <buffer> FRA <Esc>:call JL_Tex_add_fragile()<CR>
    nnoremap <buffer> <Leader>qq  <ESC>:silent call FormatLatexPar(0)<CR>
    nnoremap <buffer> <Leader>cc <Esc>:w<CR>:call Tex_CompileLatex()<CR>
    nnoremap <buffer> <F6> <Esc>:w<CR>:call Tex_CompileLatex()<CR>
    inoremap <buffer> <F6> <Esc>:w<CR>:call Tex_CompileLatex()<CR>
    nnoremap <buffer> <C-h> <Esc>?\\begin<CR>
    nnoremap <S-F10> [s
    nnoremap <S-F11> ]s
    ino <buffer> @\|-> \longmapsto
    ino <buffer> @-> \rightarrow
    ino <buffer> @--> \longrightarrow
    ino <buffer> @=> \Longrightarrow
    ino <buffer> @<-- \longleftarrow
    ino <buffer> @<- \leftarrow
    ino <buffer> @<= \Longleftarrow
    ino <buffer> @x-> \xrightarrow[]{<++>}<Esc>6hi
    ino <buffer> @. \cdot
    call IMAP('BIT', "\\begin{itemize}\<CR>\\item <++>\<CR>\\end{itemize}<++>", 'tex')
    call IMAP('BLT', "\\begin{lstlisting}\<CR> <++>\<CR>\\end{lstlisting}<++>", 'tex')
    call IMAP('BVER', "\\begin{verbatim}\<CR><++>\<CR>\\end{verbatim}<++>", 'tex')
    call IMAP('BEN', "\\begin{enumerate}\<CR>\\item <++>\<CR>\\end{enumerate}<++>", 'tex')
    call IMAP('BEQ', "\\begin{equation}\<CR>\\label{<++>}\<CR><++>\<CR>\\end{equation}<++>", 'tex')
    call IMAP('BAL', "\\begin{align}\<CR>\\label{<++>}\<CR><++>\<CR>\\end{align}<++>", 'tex')
    call IMAP('BML', "\\begin{multline}\<CR>\\label{<++>}\<CR><++>\<CR>\\end{multline}<++>", 'tex')
    call IMAP('BSEQ', "\\begin{equation*}\<CR><++>\<CR>\\end{equation*}<++>", 'tex')
    call IMAP('BCAS', "\\begin{cases}\<CR><++>\<CR>\\end{cases}<++>", 'tex')
    call IMAP('BSAL', "\\begin{align*}\<CR><++>\<CR>\\end{align*}<++>", 'tex')
    call IMAP('BSML', "\\begin{multline*}\<CR><++>\<CR>\\end{multline*}<++>", 'tex')
    call IMAP('BSPL', "\\begin{split}\<CR><++>\<CR>\\end{split}<++>", 'tex')
    call IMAP('BFR',"% --------------------------------------------------------SLIDE - %\<CR>\\begin{frame}\<CR>\\frametitle{<++>}\<CR><++>\<CR>\\end{frame}\<CR>% --------------------------------------------------------------- %\<CR>", 'tex')
    call IMAP('\{', "\\{<++>\\}<++>", 'tex')
    call IMAP('\[', "\\[\<CR><++>\<CR>\\]<++>", 'tex')
    call IMAP('::', "\\", 'tex')
    call IMAP(g:Tex_Leader.'$', "$$\<CR><++>\<CR>$$<++>", 'tex')

    " errorformat to be used with -file-line-error switch of [pdf]latex
    " command
    setlocal errorformat+=%E%f:%l:\ %m,%+C%m
endfunction

" let g:tex_flavor='pdflatex' "Required to activate latex-vim
let g:Tex_CompileRule_pdf='pdflatex -synctex=1 -file-line-error -shell-escape -interaction=nonstopmode $*'
let g:Tex_UseMakefile=0
let g:Imap_UsePlaceHolders=1
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats="pdf,bib,pdf"
let g:Tex_FoldedEnvironments="frame,exo,tabular,itemize,enumerate,thebibliography,demo,proof,tikzpicture,center,prop,thm"
let g:Tex_FoldedCommands="solution"
let g:Tex_SectionMenus = 0
let g:Tex_EnvironmentMenus = 0
let g:tex_indent_brace = 1
" Hack because Console Vim on Mac doesn't set macunix
if has("unix") && match(system("uname"),'Darwin') != -1
    let g:Tex_ViewRule_pdf = 'Skim'
endif
" let g:Tex_ShowallLines = 1
let g:Tex_Leader ='@'

function! JL_tex_tmpl ()
    let l:choice = confirm ("Choose your template : ", "&article (Default)\n&doc\n&letter", 2)
    if l:choice == 1
        0r ~/.vim/templates/tex.tmpl
    elseif l:choice == 2
        0r ~/.vim/templates/doc-tex.tmpl
    elseif l:choice == 3
        0r ~/.vim/templates/letter-tex.tmpl
    endif
endfunction
command! -nargs=0 JLTexTemplate :call JL_tex_tmpl ()
" let g:Tex_Debug = 1
" let g:Tex_DebugLog = "vim-latex-suite.log"
" }}}

" Perl stuff {{{
function! JL_Perl()
    setlocal formatoptions=cqro
    setlocal makeprg=perl\ -Wc\ %
    setlocal errorformat=%m\ at\ %f\ line\ %l%.%#,
                \%-G%.%# " ignore any lines not matching any of the above patterns
    " setlocal fdm=marker
    " setlocal foldmarker=#\ {{{,#\ }}}
endfunction
let perl_fold=1
let perl_fold_blocks=1

" }}}

" {{{ Encoding Facilities
function JLEncoding ()
    echo "Choose your conversion\n\r1. iso --> tex\n\r2. tex --> iso\n\r3. utf8 --> latin1\n\r4. latin1 --> utf8\n"
    call inputsave()
    let l:choice = input('Your choice: ')
    call inputrestore()
    if l:choice == 1
        let l:command = '%!python ~/.vim/plugin/isotex.py ' .  &fenc . ' iso2tex'
    elseif l:choice == 2
        let l:command = '%!python ~/.vim/plugin/isotex.py ' .  &fenc . ' tex2iso'
    elseif l:choice == 3
        let l:command = '%!iconv -t ISO-8859-1 -f UTF-8'
    elseif l:choice == 4
        let l:command =  '%!iconv -f ISO-8859-1 -t UTF-8'
    endif
    exec l:command
endfunction

" }}} 

" {{{ Web stuff 
let g:used_javascript_libs = 'jquery'
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
" }}}

set spelllang=en,fr
set spellsuggest=10
set spellfile=~/.vim/spellfile.add

set secure

" vim: set sw=4 ts=4 fdm=marker:
