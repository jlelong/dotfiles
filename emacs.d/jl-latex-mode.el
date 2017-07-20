;; -*- mode:lisp; coding:latin-1; -*-

;; Author : Jérôme LELONG
;; jerome.lelong@imag.fr
;; http://www-ljk.imag.fr/membres/Jerome.Lelong/
;; Unlimited permission is granted to use, copy, distribute, and/or
;; modify this program.  There is NO WARRANTY.

(require 'tex-site)

;; ------------------------------------- ;;
;; Macros for typing LaTeX

;; list of list.
;; each entry contains three fields :
;;   a character to enter
;;   the corresponding macro to insert
;;   an optional post-treatment
(defconst jl-tex-macro-list
  '(("\|->"  (insert "\\longmapsto") "")
     ("->"   (insert "\\rightarrow") "")
     ("=->"  (insert "\\Longrightarrow") "")
     ("x->"  (insert "\\xrightarrow[]{}") "")
     (">="   (insert "\\ge ") "")
     ("<="   (insert "\\le ") "")
     ("<>"   (insert "\\neq ") "")
     ("I"    (insert "\\infty") "")
     ("@("   (insert-balanced-paren ?\( ?\)) "")
     ("@["   (insert-balanced-paren ?\[ ?\]) "" )
     ("@\{"  (insert-balanced-paren "\\{" "\\}") "" )
     ("<"    (insert-balanced-paren "\\langle"  "\\rangle") "")
     ("$$"   (insert "$$\n\n$$") (previous-line))
     ("$"    (insert "$$") (backward-char 1))
     ("("    (insert "()") (backward-char 1))
     ("\\{"  (insert "\\{\\}") (backward-char 2))
     ("{"    (insert "{}") (backward-char 1))
     ("["    (insert "[]") (backward-char 1))
     ("_"    (insert "_{}") (backward-char 1))
     ("^"    (insert "^{}") (backward-char 1))
     ("int"  (insert "\\int_{}^{}") (backward-char 4))
     ("/"    (insert "\\frac{}{}") (backward-char 3))
     ("..."  (insert "\\dots") "")
     ("."    (insert "\\cdot") "")
     ("ve"   (insert "\\varepsilon") "")
     ("vj"   (insert "\\vartheta") "")
     ("vp"   (insert "\\varpi") "")
     ("vr"   (insert "\\varrho") "")
     ("vs"   (insert "\\varsigma") "")
     ("vf"   (insert "\\varphi") "")
     ))

(defun insert-balanced-paren (lhs rhs)
  (interactive)
  (insert "\\left" lhs " ")
  (save-excursion (insert " " "\\right" rhs)))

(defun jl-tex-expand-macro ()
  "This function expands the previous chars using
jl-tex-macro-list. The first matching entry is used. Be sure to put
the longest entries at the top of the list"
  (interactive)
  (let ((math jl-tex-macro-list))
    (while math
      (let* ((entry (car math))
              (key (nth 0 entry))
              (symb (nth 1 entry))
              (act (nth 2 entry))
              (len (length key))
              (str (buffer-substring (- (point) len) (point))))
        (setq math (cdr math))
        (if (equal str key)
          (progn
            (delete-char (- len))
            (eval symb)
            (eval act)
            (setq math nil)))))
    ))

;; ------------------------------------- ;;
;; Bibtex
(setq bibtex-mode-hook 
  '(lambda () 
     (auto-fill-mode 1)
     (if (eq window-system 'x)
       (font-lock-mode 1))
     ))

;; ------------------------------------- ;;
;; To turn on RefTeX Minor Mode for all LaTeX files,
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode

;;; Replace AUCTeX functions
(setq reftex-plug-into-AUCTeX t)
;; Do not compute label values automatically
(setq reftex-insert-label-flags '(nil t))

;; ------------------------------------- ;;
;; Spell Checking 
(defun jl-default-language( lang )
  (interactive "sLanguage  : fr br ")
  (save-excursion
    (goto-char (point-min))
    (if (search-forward "% -*- ispell-local-dictionary" nil t)
      (progn
        (beginning-of-line)
        (if (string-equal lang "fr")
          (progn
            (ispell-change-dictionary "francais")
            (while (re-search-forward "ispell-local-dictionary: \"[a-z]*\"" nil t)
              (replace-match  "ispell-local-dictionary: \"francais\"" nil nil))
            ))
        (if (string-equal lang "br")
          (progn
            (ispell-change-dictionary "british")
            (while (re-search-forward "ispell-local-dictionary: \"[a-z]*\"" nil t)
              (replace-match  "ispell-local-dictionary: \"british\"" nil nil))
            ))
        )
      (goto-char (point-min))
      
      (if (string-equal lang "fr")
        (progn 
          (ispell-change-dictionary "francais")
          (insert "% -*- ispell-local-dictionary: \"francais\"; -*-")
          ))
      (if (string-equal lang "br")
        (progn 
          (ispell-change-dictionary "british")
          (insert "% -*- ispell-local-dictionary: \"british\"; -*-")
          ))
      (newline-and-indent)(newline-and-indent)
      ))
  )

(defun my-fill-para ()
  "Fills a paragraph taking into account \\ "
  (interactive)
  (save-excursion
    (beginning-of-line)
    (backward-paragraph)
    (if (> (point) (point-min))
      (forward-line))
    (let ((debut (point)))
      (forward-paragraph)(end-of-line)
      (if (< (point) (point-max))
        (forward-line -1))
      (end-of-line)
      (let ((fin (point)))
        (LaTeX-fill-region-as-para-do debut fin)))))


(add-hook 'LaTeX-mode-hook
  '(lambda()
     (setq       fill-column                    78)
     (setq       comment-start                  "%")
     (define-key LaTeX-mode-map "\C-zl"        'jl-default-language)
     (define-key LaTeX-mode-map "\C-zb"        'ispell-buffer)
     (define-key LaTeX-mode-map "\C-z\t"       'indent-region)
     (define-key LaTeX-mode-map "\C-zq"        'my-fill-para)
     (define-key LaTeX-mode-map [(f12)]        'jl-tex-expand-macro)
     (define-key LaTeX-mode-map [(f6)]         'TeX-command-master)
     (define-key LaTeX-mode-map [(C-f6)]       'next-error)
     (define-key LaTeX-mode-map [(f2)]         'LaTeX-environment)     
     (define-key LaTeX-mode-map [(f3)]         'beamer-frame)     
     (setq       TeX-newline-function          'reindent-then-newline-and-indent)
     ;; to avoid small subscript or superscript
     (setq       font-latex-fontify-script      nil)
     (setq       font-latex-fontify-sectioning 'color)
     (setq       TeX-comment-start-regexp       "%")
     (setq       TeX-PDF-mode t)
     (setq       TeX-electric-sub-and-superscript nil)
     (modify-syntax-entry ?_ "w")
     (outline-minor-mode 1)
     (setq       TeX-source-correlate-mode    'synctex)
     ; (TeX-run-style-hooks
     ;   ""
     ;   "amsmath"
     ;   "listings"
     ;   "moreverb"
     ;   "verbatim"
     ;   "beamer")
     (setq LaTeX-beamer-item-overlay-flag nil)
     )
  )

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

;; Outline mode
(setq TeX-outline-extra
  '(("[ \t]*\\\\\\(bib\\)?item\\b" 7)
     ("\\\\paragraph\\b" 5)
     ("\\\\bibliography\\b" 2)))


(setq TeX-view-program-list '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")))
(setq TeX-view-program-selection '((output-pdf "Skim")))

;; ------------------------------------- ;;
;;insert frame environment beamer
(defun beamer-frame( titre )
  (interactive "stitle : ")
  (insert "% --------------------------------------------------------SLIDE - %")
  (newline-and-indent)  
  (insert "\\begin{frame}")
  
  (if (y-or-n-p "allow frame break?")
    (insert "[allowframebreaks]"))
  (newline-and-indent)
  (insert "\\frametitle{")(insert titre)(insert "}")
  (newline-and-indent)
  (newline-and-indent)
  (newline-and-indent)
  (insert "\\end{frame}")(indent-for-tab-command)
  (newline-and-indent)
  (insert "% --------------------------------------------------------------- %")
  (newline-and-indent)
  (forward-line -3)
  (newline-and-indent)
  )

;; Empèche Ispell de vérifier le contenu de certaines commandes 
(setq ispell-tex-skip-alists
  (list
    (append (car ispell-tex-skip-alists)
      '(("\\\\cite"            ispell-tex-arg-end)
         ("\\\\nocite"          ispell-tex-arg-end)
         ("\\\\includegraphics" ispell-tex-arg-end)
         ("\\\\figScale"        ispell-tex-arg-end)
         ("\\\\author"          ispell-tex-arg-end)
         ("\\\\ref"             ispell-tex-arg-end)
         ("\\\\hypref"          ispell-tex-arg-end)
         ("\\\\hypreff"         ispell-tex-arg-end)
         ("\\\\eqref"           ispell-tex-arg-end)
         ("\\\\label"           ispell-tex-arg-end)
         ))
    (cadr ispell-tex-skip-alists)))



;; ------------------------------------- ;;
;; init latex file 
(defvar template-dir "~/local/emacs.d")
(defun jl-template-latex (type)
  (interactive "sdocument type (article doc letter) : ")
  (if (string-equal type "article")
    (insert-file-contents (concat template-dir "/template-article.tex")))
  (if (string-equal type "doc")
    (insert-file-contents (concat template-dir "/template-doc.tex")))
  (if (string-equal type "letter")
    (insert-file-contents (concat template-dir "/template-letter.tex")))
  )

(provide 'jl-latex-mode)

;; end of jl-latex-mode ;;
