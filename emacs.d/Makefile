ELFILES=hhm-config.el \
html-helper-mode.el\
jl-C-C++mode.el\
jl-latex-mode.el\
jl-menu.el\
jl-macro.el\
jl-Perl-mode.el\
scilab.el\
pnl.el

ELCFILES=${ELFILES:%.el=%.elc}
EMACS=/usr/local/bin/emacs
EMACSFLAGS=-batch -f batch-byte-compile

all:$(ELCFILES) 

clean:
	$(RM) $(ELCFILES)


%.elc: %.el
	$(EMACS) $(EMACSFLAGS) $<


