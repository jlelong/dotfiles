;; -*- mode:lisp; coding:latin-1; -*-

;; Author : Jérôme LELONG
;; jerome.lelong@imag.fr
;; http://www-ljk.imag.fr/membres/Jerome.Lelong/
;; Unlimited permission is granted to use, copy, distribute, and/or
;; modify this program.  There is NO WARRANTY.


(require 'cperl-mode)
;; Ok, cperl-mode gets _really_ unhappy if perl mode gets loaded
;; after it, so make sure it doesn't happen...
(defalias 'perl-mode 'cperl-mode)


;; deactivate underscore for trailing wihite space 
(setq cperl-invalid-face nil)

;; Use cperl-mode instead of the default perl-mode

(autoload 'cperl-mode "cperl-mode" "cperl-mode" t)
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
          
;; Since I do not like the default indentations, I have the followings:

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(defun n-cperl-mode-hook ()
  (cperl-set-style "BSD")
  (custom-set-faces
   '(cperl-array-face ((t (:foreground "DeepPink" :weight normal))))
   '(cperl-hash-face ((t (:foreground "DeepPink" :slant normal :weight normal)))))
  (set-face-foreground 'cperl-nonoverridable-face  "RoyalBlue")
  )



(add-hook 'cperl-mode-hook
	  '(lambda()
	     (define-key cperl-mode-map [(f2)] 'jl-prog-accolade)))

(defun perltidy-command(start end)
  "The perltidy command we pass markers to."
  (shell-command-on-region start 
                           end 
                           "perltidy" 
                           t
                           t
                           (get-buffer-create "*Perltidy Output*")))

;; Updated as a dwim.  I like using the existing buffer rather than
;; creating a new buffer.
(defun perltidy-dwim (arg)
  "Perltidy a region of the entire buffer"
  (interactive "P")
  (let ((point (point)) (start) (end))
	(if (and mark-active transient-mark-mode)
		(setq start (region-beginning)
			  end (region-end))
        (setq start (point-min)
              end (point-max)))
	(perltidy-command start end)
	(goto-char point)))


(provide 'jl-Perl-mode)
