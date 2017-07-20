(setq load-path (cons (expand-file-name "~/local/emacs.d") load-path))
(load-file "~/local/emacs.d/haypo_style.el")
(load "tex-site")
(load "scilab")


(setq auto-mode-alist
      (append
       '(
         ("\\.c$" . c-mode)
         ("\\.java$" . java-mode)
         ("\\.C$" . c++-mode)
         ("\\.cpp$" . c++-mode)
         ("\\.cc$" . c++-mode)
         ("\\.h$" . c++-mode)
         ("\\.hh$" . c++-mode)
         ("\\.H$" . c++-mode)
         ("\\.tex$" . LaTeX-mode)
         ("\\.emacs$" . emacs-lisp-mode)
         ("\\.el$" . emacs-lisp-mode)
         ("\\.\\(sci\\|sce\\)$" . scilab-mode)
         )
       auto-mode-alist)
      )

(setq default-major-mode 'indented-text-mode)
(setq indent-tabs-mode nil)

(require 'cl)
(setq lisp-indent-function 'common-lisp-indent-function)

(add-hook 'c-mode-hook
		  '(lambda()
			(setq-default tab-width 4)
			(setq tab-width 4)
			(c-set-style "haypo")
			(setq indent-tabs-mode nil)))  

(add-hook 'c++-mode-hook
		  '(lambda()
			(setq-default tab-width 4)
			(setq tab-width 4)
			(c-set-style "haypo")
			(setq indent-tabs-mode nil)))  



