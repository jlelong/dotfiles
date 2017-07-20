;; -*- mode:lisp; coding:latin-1; -*-

;; Author : Jérôme LELONG
;; jerome.lelong@imag.fr
;; http://www-ljk.imag.fr/membres/Jerome.Lelong/
;; Unlimited permission is granted to use, copy, distribute, and/or
;; modify this program.  There is NO WARRANTY.

(require 'cc-mode)
(require 'compile)

(defvar font-lock-number-face 'font-lock-number-face)
(defface font-lock-number-face
    '((((class color)(background light)) (:foreground "blue"))
      (((class color)) (:foreground "blue"))
      (t (:inverse-video t)))
  "Font Lock face used to highlight literals."
  :group 'font-lock-faces)

(set-face-foreground 'font-lock-number-face "green3")
;; macros which highlight things that basic modes don't
(defvar hi-numbers
  '(("\\b\\(0[xX][0-9a-fA-F]+[lL]?\\|[0-9]+\\.?[0-9]*\\([eE][-+]?[0-9]+\\)?\\([lL]\\|[fF]\\|[dD]\\)?\\)\\b" 1
     font-lock-number-face)))
(defvar hi-c
  '(("\\b\\(NULL\\|stdin\\|stdout\\|stderr\\)\\b" 1
     font-lock-constant-face)))
(defvar hi-cpp
  '(("\\b\\(cin\\|cout\\|cerr\\|endl\\)\\b" 1
     font-lock-keyword-face)
    ("\\b\\(std\\|ios_base\\)\\b" 1
     font-lock-type-face)))

;; Highlight Pnl types

(defvar new-c-type
  '(("\\b\\(FILE\\)\\b" 1
     font-lock-type-face)))

;; highlight numbers in all significant modes
(font-lock-add-keywords 'c-mode hi-numbers)
(font-lock-add-keywords 'c++-mode hi-numbers)
(font-lock-add-keywords 'c-mode hi-c)
(font-lock-add-keywords 'c++-mode hi-c)
(font-lock-add-keywords 'c++-mode hi-cpp)

;; highlight types in C
(font-lock-add-keywords 'c++-mode new-c-type)
(font-lock-add-keywords 'c-mode new-c-type)


;; compilation stuff
(setq compilation-read-command t)
(setq compile-command "make")
(setq compilation-window-height 15)
(setq compilation-scroll-output t)
(setq compile-auto-highlight t)

(require 'compile)
;; change the coding system because the output of the compiler is
;; encoding according to LC_ALL. So, if you use UTF-8 as locale then
;; turn to utf-8 as prefer coding system
;; TERM=emacs inhibits the post-treatment of colorgcc
(defun my-compilation-mode-hook ()
  (make-local-variable 'process-environment)
  (prefer-coding-system 'utf-8)
  (setq process-environment (cons "TERM=emacs" process-environment))
  )
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

(defvar dired-font-lock-keywords
  '(("\\(.*\\(cpp\\|cc\\|c\\|C\\)\\)$" 1 font-lock-variable-name-face)
    ("\\(.*\\(hh\\|h\\|H\\)\\)$" 1 font-lock-type-face)
    ("\\(.*\\(Makefile\\)\\(.*\\)\\)" 1 font-lock-comment-face)
    ("\\(^  d\\(.+\\)\\)" 1 font-lock-keyword-face)))

(defun more-c-hooks ()
  (define-key  c-mode-map    [(f7)]      'doxymacs-insert-function-comment)
  (define-key  c-mode-map    "\C-zq"      'fill-region)
  (define-key  c++-mode-map  [(f7)]      'doxymacs-insert-function-comment)
  (define-key  c++-mode-map  "\C-zq"      'fill-region)
  (setq indent-tabs-mode nil)
  (auto-fill-mode t)
  (c-set-style "gnu")
  (setq c-basic-offset 2)
  (c-set-offset 'inextern-lang 0)
  (c-set-offset 'brace-list-open 0)
  (c-set-offset 'brace-list-close 0)
  (setq c-recognize-knr-p t)
  (setq comment-multi-line t)
  (setq comment-start "/* ")
  (setq comment-end "*/")
  (setq c-block-comment-prefix "*")
  (add-to-list 'c-cleanup-list 'comment-close-slash)
  (setq fill-column 78)
  (setq comment-style 'multi-line)
  (modify-syntax-entry ?_ "w" c++-mode-syntax-table)
  (modify-syntax-entry ?_ "w" c-mode-syntax-table)
  )

(add-hook 'c-mode-hook 'more-c-hooks)
(add-hook 'c++-mode-hook 'more-c-hooks)

(provide 'jl-C-C++mode)
