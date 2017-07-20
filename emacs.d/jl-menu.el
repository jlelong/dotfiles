;; -*- mode:lisp; coding:latin-1; -*-

;; Author : J�r�me LELONG
;; jerome.lelong@imag.fr
;; http://www-ljk.imag.fr/membres/Jerome.Lelong/
;; Unlimited permission is granted to use, copy, distribute, and/or
;; modify this program.  There is NO WARRANTY.

;; This file adds a new menu to Emacs

;; accents
(require 'iso-cvt)
(defvar jl-iso-iso2tex-trans-tab
  '(
    ("�" "\\\\\"a")
    ("�" "\\\\`a")
    ("�" "\\\\'a")
    ("�" "\\\\~a")
    ("�" "\\\\^a")
    ("�" "\\\\\"e")
    ("�" "\\\\`e")
    ("�" "\\\\'e")
    ("�" "\\\\^e")
    ("�" "{\\\\\"\\\\i}")
    ("�" "{\\\\`\\\\i}")
    ("�" "{\\\\'\\\\i}")
    ("�" "{\\\\^\\\\i}")
    ("�" "\\\\\"o")
    ("�" "\\\\`o")
    ("�" "\\\\'o")
    ("�" "\\\\~o")
    ("�" "\\\\^o")
    ("�" "\\\\\"u")
    ("�" "\\\\`u")
    ("�" "\\\\'u")
    ("�" "\\\\^u")
    ("�" "\\\\\"A")
    ("�" "\\\\`A")
    ("�" "\\\\'A")
    ("�" "\\\\~A")
    ("�" "\\\\^A")
    ("�" "\\\\\"E")
    ("�" "\\\\`E")
    ("�" "\\\\'E")
    ("�" "\\\\^E")
    ("�" "\\\\\"I")
    ("�" "\\\\`I")
    ("�" "\\\\'I")
    ("�" "\\\\^I")
    ("�" "\\\\\"O")
    ("�" "\\\\`O")
    ("�" "\\\\'O")
    ("�" "\\\\~O")
    ("�" "\\\\^O")
    ("�" "\\\\\"U")
    ("�" "\\\\`U")
    ("�" "\\\\'U")
    ("�" "\\\\^U")
    ("�" "\\\\~n")
    ("�" "\\\\~N")
    ("�" "{\\\\c c}")
    ("�" "{\\\\c C}")
    ("�" "{\\\\ss}")
    ("\306" "{\\\\AE}")
    ("\346" "{\\\\ae}")
    ("\305" "{\\\\AA}")
    ("\345" "{\\\\aa}")
    ("\251" "{\\\\copyright}")
    ("�" "{\\\\pounds}")
    ("�" "{\\\\P}")
    ("�" "{\\\\S}")
    ("�" "{?`}")
    ("�" "{!`}")
    )
  "Translation table for translating ISO 8859-1 characters to TeX sequences.")


(defun iso-to-tex-accents ()
  (interactive)
  "Converts standard ISO accents to plain TeX"
  (save-excursion
    (goto-char (point-min))
    (let (begin end)
     (setq begin (point))
     (goto-char (point-max))
     (setq end (point))
     (iso-translate-conventions begin end jl-iso-iso2tex-trans-tab)))
  )

(defun tex-to-iso-accents ()
  (interactive)
  "Converts plain TeX accents to standard ISO accents"
  (save-excursion
    (goto-char (point-min))
    (let (begin end)
     (setq begin (point))
     (goto-char (point-max))
     (setq end (point))
     (iso-tex2iso begin end)))
  )

(defun to-iso-unix ()
  (interactive)
  "Converts buffer to iso Latin 1 Unix"
  (set-buffer-file-coding-system 'latin-1-unix))

(defun dos-to-unix ()
  (interactive)
  "Convert the ^M to line feed "
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "" nil t)
      (replace-match "" nil nil))
    ))

(defun set-kr ()
  (interactive)
  (c-set-style "k&r")
  (setq c-basic-offset 4))

(defun clean-code ()
  (interactive)
  "Converts from dos to unix if needed. Replaces tabs by spaces,
reindents the code and removes trailing spaces"
  (dos-to-unix)
  (save-excursion
    (untabify (point-min) (point-max))
    (indent-region (point-min) (point-max) nil)
    (delete-trailing-whitespace)
    ))

(defun indent-buffer ()
  (interactive)
  (untabify (point-min) (point-max))
  (indent-region (point-min) (point-max) nil)
  (save-buffer))

(defvar menu-bar-JL-menu (make-sparse-keymap "JL"))
(define-key global-map [menu-bar JL] (cons "JL" menu-bar-JL-menu))

(define-key menu-bar-JL-menu [L1] '("LaTeX To Std" . tex-to-iso-accents ))
(define-key menu-bar-JL-menu [L2] '("Std to LaTeX" . iso-to-tex-accents ))
(define-key menu-bar-JL-menu [L3] '("To Unix Latin 1" . to-iso-unix ))
(define-key menu-bar-JL-menu [L4] '("Remove Win EOL"  . dos-to-unix ))
(define-key menu-bar-JL-menu [L5] '("DEL trailing space"  . delete-trailing-whitespace ))
(define-key menu-bar-JL-menu [L6] '("Clean code"  . clean-code ))
(define-key menu-bar-JL-menu [L7] '("Start server"  . server-start ))
(define-key menu-bar-JL-menu [L8] '("Set K&R C mode"  . set-kr ))
(define-key menu-bar-JL-menu [L9] '("LaTeX templates"  . template-latex ))
(define-key menu-bar-JL-menu [L10] '("Indent Buffer"  . indent-buffer ))

