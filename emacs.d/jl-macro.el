;; -*- mode:lisp; coding:latin-1; -*-

;; Author : Jérôme LELONG
;; jerome.lelong@imag.fr
;; http://www-ljk.imag.fr/membres/Jerome.Lelong/
;; Unlimited permission is granted to use, copy, distribute, and/or
;; modify this program.  There is NO WARRANTY.


(defun gpl-verbatim ()
  "add the GPL text at the point"
  (interactive)
  (let ((comment-style 'box)
        (gpl
         (concat
          (if (boundp 'user-full-name)
              (concat "\nCopyright " user-full-name " ")
              "")
          (if (boundp 'user-mail-address)
              (concat "<" user-mail-address ">\n")
              "")
          "\n"
          "This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
"
          )))
(let ((here (point)))
  (insert gpl)
  (comment-region here (+ here (length gpl))))
)
)

(defun lgpl-verbatim ()
  "add the LGPL text at the point"
  (interactive)
  (let ((comment-style 'box)
        (gpl
         (concat
          (if (boundp 'user-full-name)
              (concat "\nCopyright " user-full-name " ")
              "")
          (if (boundp 'user-mail-address)
              (concat "<" user-mail-address ">\n")
              "")
          "\n"
          "This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this program.  If not, see
<http://www.gnu.org/licenses/>.
"
          )))
(let ((here (point)))
  (insert gpl)
  (comment-region here (+ here (length gpl))))
)
)




;;needed in insert-buffer/file/dir-name functions
(defun buffer-name-not-mini ()
  "Return the name of current buffer, as a string.
   If current buffer is the *mini-buffer* return name of previous-window."
  (buffer-name (if (window-minibuffer-p)
                   (if (eq (get-lru-window) (next-window))
                       (window-buffer (previous-window))
                       (window-buffer (next-window)))
                   nil)))



;; Some new functions for folding
;; From http://www.emacswiki.org/emacs-en/HideShow

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
    (or column
      (unless selective-display
        (1+ (current-column))))))
(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
    (if (condition-case nil
          (hs-toggle-hiding)
          (error t))
      (hs-show-all))
    (toggle-selective-display column)))
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)

(defun align-repeat (start end regexp)
    "Repeat alignment with respect to 
     the given regular expression."
    (interactive "r\nsAlign regexp: ")
    (align-regexp start end 
        (concat "\\(\\s-*\\)" regexp) 1 1 t))

(provide 'jl-macro)

