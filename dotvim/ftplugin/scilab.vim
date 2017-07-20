" Vim filetype plugin file
" Language:	scilab
" Maintainer:	Fabrice Guy <fabrice.guy at gmail dot com>
" Last Changed: 2010 May 19
" This file was originally for matlab

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo-=C

setlocal fo+=croql
setlocal comments=:%//,://

if exists("loaded_matchit")
  let s:conditionalEnd = '\([-+{\*\:(\/]\s*\)\@<!\<end\>\(\s*[-+}\:\*\/)]\)\@!'
  let b:match_words = '\<classdef\>\|\<methods\>\|\<events\>\|\<properties\>\|\<if\>\|\<while\>\|\<for\>\|\<switch\>\|\<try\>\|\<function\>:' . s:conditionalEnd
endif

let &cpo = s:save_cpo
