;; Jérôme LELONG
;; CERMICS (ENPC)
;; http://cermics.enpc.fr/~lelong
;; lelong@cermics.enpc.fr
;; Last modified: Fri Nov 26 2004

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Ce mode mineur permet d'insérer les délimiteurs ;;;
;;; par pair. Exemple () {} [] ""                   ;;;
;;; Pour désactiver ce mode utiliser                ;;;
;;; (setq jl-paren-mode nil)                        ;;;
;;; par défaut ce mode est activé au lancement      ;;;
;;; d'emacs en ajoutant dans votre .emacs           ;;;
;;; (require 'jl-paren)                             ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defun jl-brak1 ()
(interactive)
(insert "(")
(insert ")")
(backward-char 1))

(defun jl-brak2 ()
(interactive)
(let ((c (char-before)))
  (insert "[")
  (if (equal (char-to-string c) "\\")
      (progn 
        (newline-and-indent)
        (newline-and-indent)
        (insert "\\]")
        (forward-line -1)
        (indent-for-tab-command)
        )
      (insert "]")
      (backward-char 1)
      )
  )
)


(defun jl-brak3 ()
(interactive)
(insert "{")
(insert "}")
(backward-char 1))

(defun jl-brak6 ()
(interactive)
(insert "\"")
(insert "\"")
(backward-char 1))

(defun jl-prog-accolade ()
  (interactive)
  (insert "{")(indent-according-to-mode)
  (newline)(indent-according-to-mode)
  (newline) (insert "}")(indent-according-to-mode)
  (forward-line -1) (indent-according-to-mode)
  )


(defvar jl-paren-mode t)
(if jl-paren-mode
  ())

;(defvar jl-paren-mode-prefix-map nil)
(defvar jl-paren-mode-map nil)

(if jl-paren-mode-map
  ()
  (setq jl-paren-mode-map (make-sparse-keymap))
  (define-key jl-paren-mode-map "("  'jl-brak1)
  (define-key jl-paren-mode-map "["  'jl-brak2)
  (define-key jl-paren-mode-map "{"  'jl-brak3))

(defun jl-paren-mode ()
  (interactive)  
  (setq jl-paren-mode (not jl-paren-mode)))

(or (assq 'jl-paren-mode minor-mode-alist)
    (setq minor-mode-alist
	  (cons '(jl-paren-mode " jl-paren") minor-mode-alist)))
(if (not (assq 'jl-paren-mode minor-mode-map-alist))
      (setq minor-mode-map-alist
	       (cons (cons 'jl-paren-mode jl-paren-mode-map)
		       minor-mode-map-alist)))

(provide 'jl-paren)
