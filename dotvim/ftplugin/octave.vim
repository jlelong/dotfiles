" Vim filetype plugin to display 
" Language: Octave
" Maintainer: Jerome Lelong <jerome.lelong@gmail.com>
"
" This plugin enables to display Octave's help in a Vim buffer.
" This plugin is strongly inspired from the Vim filtype plugin for the man
" language
"
" " Vim filetype plugin file
" " Language:	man
" " Maintainer:	SungHyun Nam <goweol@gmail.com>
" " Last Change:	2008 Sep 17

if exists('b:did_octaveplugin')
  finish
endif
let b:did_octaveplugin = 1

com! -nargs=+ OctaveHelp call s:OctaveHelp(<f-args>)

func! s:OctaveHelp(page)
  " To support:	    nmap K :Man <cword>
  let page = a:page 
  if page == '<cword>'
    let page = expand('<cword>')
  endif

  " Use an existing "man" window if it exists, otherwise open a new one.
  if &filetype != "man"
    let thiswin = winnr()
    exe "norm! \<C-W>b"
    if winnr() > 1
      exe "norm! " . thiswin . "\<C-W>w"
      while 1
	if &filetype == "man"
	  break
	endif
	exe "norm! \<C-W>w"
	if thiswin == winnr()
	  break
	endif
      endwhile
    endif
    if &filetype != "man"
      new
      setl nonu fdc=0
    endif
  endif
  silent exec "edit $HOME/".page."~"
  " Avoid warning for editing the dummy file twice
  setl buftype=nofile noswapfile

  setl ma
  silent exec "norm 1GdG"
  silent exec "r!/usr/local/bin/octave --silent --eval 'help ".page."; quit;' | col -b"
  " Remove blank lines from top and bottom.
  while getline(1) =~ '^\s*$'
    silent norm ggdd
  endwhile
  while getline('$') =~ '^\s*$'
    silent norm Gdd
  endwhile
  silent norm 7k
  silent norm dG
  1
  setl ft=man nomod
  setl bufhidden=hide
  setl nobuflisted
endfunc

" vim: set sw=2:
