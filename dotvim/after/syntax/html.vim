" syn region SynFold 
"       \ start="\v\<%(param|link|isindex|input|hr|frame|col|br|basefont|base|area|img|meta)@!\z([a-z]+)%(\_s[^>]*[^>/])*\>" 
"       \ end="</\z1>" 
"       \ transparent fold keepend extend 
"       \ containedin=ALLBUT,htmlComment

syntax region htmlFold start="<\z(\<\(area\|base\|br\|col\|command\|embed\|hr\|img\|input\|keygen\|link\|meta\|para\|source\|track\|wbr\>\)\@![a-z-]\+\>\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)" end="</\z1\_s*>" fold transparent keepend extend containedin=htmlHead,htmlH\d

