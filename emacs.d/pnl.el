(require 'cc-mode)

(defvar pnl-types
  '("Pnl[a-zA-Z]+" "Pnl[a-zA-Z]*Object" "Pnl[0-9a-zA-Z]*Func[0-9a-zA-Z]*" "dcomplex"))

(defvar pnl-const
  '(
     ("\\b\\(PNL_[a-zA-Z_]+\\|CONE\||CZERO\\)\\b" 1 font-lock-constant-face)
     ))

(font-lock-add-keywords 'c-mode pnl-const)
(font-lock-add-keywords 'c++-mode pnl-const)

(setq c-font-lock-extra-types (append c-font-lock-extra-types pnl-types))
(setq c++-font-lock-extra-types (append c++-font-lock-extra-types pnl-types))

