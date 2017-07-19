# alias for bash

alias mkdir='mkdir -m 755'
alias rm='rm -i'
alias la='ls -a'
alias lal='ls -al -h'
alias l='ls'
alias ll='ls -o -h'
alias ls='gls --color=auto'
# alias ls='ls -G'
alias j='jobs -l'
alias k='kill -9 %%1'
alias h='history 15'
alias texclean="rm -f *.aux  *.toc  *.out  *.brf  *~  *.blg  *.bbl *.bbl.old  *.snm  *.nav *.log *.lof *.dvi *.vrb *.tns *.pdf.mk *.synctex.gz *.fdb_latexmk *.fls *.run.xml *.bcf"
alias objrclean="find . \( -name '*.o' -o -name '.*o~' \) -exec echo \"Deleting : \" {} \; -exec rm -f  {} \;"
alias rclean="find . -type f \( -name '.#*' -o -name '#*' -o -name '*~' -o -name '.*~' -o -name 'core' \) -exec echo 'Deleting : ' {} \; -exec rm -f -r {} \;"
alias clean="find . -type f -maxdepth 1 \( -name '.#*' -o -name '#*' -o -name '*~' -o -name '.*~' -o -name 'core' \) -exec echo 'Deleting : ' {} \; -exec rm -f -r {} \;"

alias .....='cd ../../../..'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'

alias s='slogin'
alias connect-strava=' mysql -ustravauser -S/Applications/MAMP/tmp/mysql/mysql.sock strava'

alias memcheck='valgrind --tool=memcheck --leak-check=full --show-reachable=yes'
alias phone='cat ~/.dial'
alias pdflatex='pdflatex -synctex=1'
alias byte-compile='/usr/bin/emacs -batch -q -f batch-byte-compile'
alias astyle-gnu='astyle --style=gnu -n -p -k3 -H -U -s2 -z2 -xk'
alias astyle-bsd='astyle -A1 -n -p -k3 -H -U -s4 -z2 -xk'

# Apps alias 
alias g='git'
alias e='vim'
alias m='more'
alias v='gvim'
alias vc='gvim --remote'
alias acroread="open -a 'Adobe Acrobat Reader DC.app'"
alias skim="open -a Skim.app"
alias openoffice="open -a 'OpenOffice.org.app'"
alias o='open'

# Mac address
alias swap_macaddress='sudo ifconfig en2 ether 00:19:e3:36:dd:2f'
alias restore_macaddress='sudo ifconfig en2 ether 80:49:71:0f:e7:b6'

alias wine="DYLD_FALLBACK_LIBRARY_PATH=\"/usr/X11/lib:/usr/lib\" /Applications/Wine.app/Contents/Resources/bin/wine"
