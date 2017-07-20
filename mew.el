;; -*-mode:lisp; coding:latin-1-*-

;; Jérôme LELONG
;; CERMICS (ENPC)
;; http://cermics.enpc.fr/~lelong
;; lelong@cermics.enpc.fr


;; ----------------------------------------------- ;;
;; to handle several accounts.
;; use C to change account when in summary mode
(setq mew-config-alist
      '(
        ("default"
         ("mailbox-type" . imap)
         ("proto" . "%")
         ("imap-server" . "XXXXX")
         ("imap-ssl" . t)
         ("imap-user" . "XXXXX")
         ("user" . "jerome.lelong")
         ("name" . "Jérôme Lelong")
         ("imap-delete" . nil)
         ("imap-size" . 0)
         ("smtp-server" . "XXXXXX")
         ("smtp-ssl" . nil )
         ("mail-domain" . "XXXXXX")
         ;;("signature-file" . "~/.signature.mew")
         ("fcc" . "%Sent")
         ("inbox-folder" . "%inbox")
         ("imap-friend-folder" . "%from")
         ("imap-trash-folder" . "%Trash")
         )
        )
      )


;; ----------------------------------------------- ;;
;; general config for all accounts

(setq mew-smtp-ssl-port "465")
(setq mew-prog-ssl "/usr/bin/stunnel4")
(setq mew-ssl-verify-level 0)
(setq mew-pop-auth 'pass) 
(setq mew-pop-size 0)
(setq mew-smtp-port "25")
(setq mew-mbox-command "incm")
(setq mew-auto-flush-queue t)
(setq mew-decode-broken t)
(setq mew-summary-form-mark-spam t)
;; ----------------------------------------------- ;;


;; ----------------------------------------------- ;;
;; Default paths
(setq mew-mail-path "~/live/Mail-Mew")
(setq mew-conf-path mew-mail-path)
(setq mew-addrbook-file "~/live/dotfiles/.Addressbook")

;;; remember last directory when saving
(setq mew-summary-preserve-dir t)
(setq mew-draft-preserve-dir t)
;; ----------------------------------------------- ;;





;; ----------------------------------------------- ;;
;; insert signature
(setq mew-signature-insert-last nil)
(setq mew-signature-as-lastpart nil)
(add-hook 'mew-before-cite-hook 'mew-header-goto-body)
;; (add-hook 'mew-draft-mode-newdraft-hook 'my-mew-draft-append-signature)
;; (defun my-mew-draft-append-signature ()
;;   (let ((mew-signature-insert-last t))
;;     (mew-draft-insert-signature)))
;; ----------------------------------------------- ;;



;; ----------------------------------------------- ;;
;; Password
;; WARNING: Password is stored in Emacs with RAW format.
(setq mew-use-cached-passwd t) ;; nil
(setq mew-passwd-timer-unit 1) ;; 10 (minutes)
(setq mew-passwd-lifetime 300000) ;; 2
;; ----------------------------------------------- ;;


;; ----------------------------------------------- ;;
;; Biff
(setq mew-auto-get nil)
(setq mew-use-biff t) ;; nil
(setq mew-use-biff-bell nil) ;; nil
(setq mew-imap-biff-interval 4) ;; 5 (minutes)
(setq mew-biff-interval mew-imap-biff-interval) ;; for Mew 
;; ----------------------------------------------- ;;



(setq mew-use-alternative nil)

(defvar mew-field-circular-completion-switch
  '(("To:"          . mew-circular-complete-domain)))


;; ----------------------------------------------- ;;
;; look and feel
;;(setq mew-decode-broken nil)
(setq mew-window-use-full t)
(setq mew-underline-lines-use t)
(setq mew-use-fancy-thread t)
(setq mew-use-fancy-highlight-body t)
(setq mew-fancy-highlight-body-prefix-width 10)
(setq mew-highlight-body-regex-comment "^[;#?%]+.*")
(setq mew-prog-imls-arg-list '("--thread=yes" "--indent=2"))
;;(setq mew-use-highlight-mouse-line t)
;; ceci pour remplacer le curseur par une barre
;; colorée, c'est selon les goûts
(setq mew-use-highlight-cursor-line t)
(setq mew-highlight-cursor-line-face 'underline)
(setq mew-use-cursor-mark t)
;; La forme originale du sommaire ne me plait pas
;;(setq mew-summary-form
;;            '(type (5 date) " " (-4 size) " " (24 from) " " t (40 subj)))

(setq mew-summary-form
      '(type (5 date) "/" (4 year) " " (20 from) "  " t (0 subj) ))
(setq mew-sort-default-key "date")

(set-face-foreground   'mew-face-mark-delete    "red") 
(set-face-bold-p       'mew-face-mark-delete  t)
(set-face-foreground   'mew-face-mark-refile    "darkgreen") 
(set-face-bold-p       'mew-face-mark-refile  t)
(set-face-bold-p       'mew-face-mark-review  t)
(set-face-bold-p       'mew-face-mark-unread  t)



;; ----------------------------------------------- ;;


;; ----------------------------------------------- ;;
;; external applications
(setq browse-url-netscape-program "/usr/bin/iceweasel")
(setq browse-url-mozilla-program "/usr/bin/iceweasel")
(setq thing-at-point-url-path-regexp "[~/A-Za-z0-9---_.${}#%,:]+")

(setq mew-prog-text/html         'mew-mime-text/html-w3m) 
(setq mew-prog-text/html-ext     "/usr/bin/iceweasel")
(setq mew-prog-text/xml         'mew-mime-text/html-w3m) 
(setq mew-prog-text/xml-ext     "/usr/bin/iceweasel")
(setq mew-prog-application/xml         nil)
(setq mew-prog-application/xml-ext     "/usr/bin/iceweasel")
(setq browse-url-browser-function 'browse-url-netscape)
(setq mew-prog-postscript      '("evince" ("") t))
(setq mew-prog-pdf      '("evince" ("") t))

(setq mew-prog-msword '("ooffice" nil t))
(setq mew-prog-msexcel '("ooffice" nil t))
(setq mew-prog-mspowerpoint '("ooffice" nil t))
;; ----------------------------------------------- ;;


;; ----------------------------------------------- ;;
;; @ browse-url
(autoload 'browse-url-interactive-arg "browse-url")
(autoload 'browse-url-browser-function "browse-url"
  "Ask a WWW browser to show a URL." t)
(autoload 'browse-url-at-point "browse-url"
  "Ask a WWW browser to load the URL at or before point." t)
(autoload 'browse-url-at-mouse "browse-url"
  "Ask a WWW browser to load a URL clicked with the mouse." t)
(autoload 'browse-url-of-buffer "browse-url"
  "Ask a WWW browser to display BUFFER." t)
(autoload 'browse-url-of-file "browse-url"
  "Ask a WWW browser to display FILE." t)
(autoload 'browse-url-of-dired-file "browse-url"
  "In Dired, ask a WWW browser to display the file named on this line." t)
;; key bind
;;  Mew Message mode
(add-hook 'mew-message-mode-hook
          (function
           (lambda ()
            (local-set-key [mouse-2] 'browse-url-at-mouse)
            )))

;; ----------------------------------------------- ;;


;; ----------------------------------------------- ;;
;; unread mark
(setq mew-use-unread-mark t)  
;; only put U on "+inbox" "%inbox" "+debian"
(setq mew-unread-mark-list
      '((("+inbox" "%inbox" "+debian") t)
        (t nil)))
(setq mew-delete-unread-mark-by-mark nil)
;; ----------------------------------------------- ;;



;; ----------------------------------------------- ;;
;; Auto-refile
(defvar mew-refile-guess-control
  '(mew-refile-guess-by-alist
    mew-refile-ctrl-auto-boundary
    mew-refile-ctrl-throw
    mew-refile-guess-by-from
    mew-refile-ctrl-throw
    mew-refile-guess-by-thread
    mew-refile-ctrl-throw
    mew-refile-guess-by-default)
  )

;; ----------------------------------------------- ;;


;; ----------------------------------------------- ;;
;; reply citation

;; 'body --> reply before citation
;; 'end  --> reply after citation
(setq mew-summary-reply-with-citation-position 'body)
(setq mew-cite-hook 'sc-cite-original)
(setq sc-preferred-header-style 5)
(setq sc-auto-fill-region-p t)

;; ;; when no supercite
;; (setq mew-addrbook-for-cite-label 'nickname)
;; (setq mew-draft-cite-fill-mode 'wrap)
;; (setq mew-draft-cite-label-fill-column 50)

;; (setq mew-cite-prefix-function (lambda()
;;                               (setq prefix (mew-cite-prefix-username))
;;                               (concat "\t test" prefix)
;;                               )
;;    )
;; (setq mew-addrbook-for-cite-prefix 'nickname)
;; (setq mew-cite-fields '("From:"))
;; (setq mew-cite-format "\n\n>>>>> %s wrote:\n\n")
;; (setq mew-cite-prefix "> ")
;; (setq mew-cite-fields '("From:" "Subject:" "Date:"))
;; (setq mew-cite-format 
;; "\n\n-------- Original Message ---------\n\
;; From: %s\nSubject: %s\nDate: %s\n\n")
;; ----------------------------------------------- ;;




;; to use w3m
(setq mew-mime-multipart-alternative-list '("Text/Html" "Text/Plain" "*."))


(setq mew-mail-domain-list
      '("cermics.enpc.fr" "ensta.fr"))


;; ----------------------------------------------- ;;
;; dans affichage mew d'un mail, quelles info afficher
(setq mew-field-spec 
      '(
        ("^Subject:$" t mew-face-header-important mew-face-header-subject)
        ("^From:$" t mew-face-header-important mew-face-header-from)
        ("^\\(To\\|Apparently-To\\):$" t mew-face-header-important
         mew-face-header-to)
        ("^\\(Cc\\|Bcc\\):$" t mew-face-header-important mew-face-header-to)
        ("^Newsgroups:$" t mew-face-header-important mew-face-header-to)
        ("^Date:$" t mew-face-header-important mew-face-header-date)
        ("^Reply-To:$" t)
        ("^X-Mailer:$" t)
        ("^X-Mew:$" t mew-face-header-important mew-face-header-xmew)
        ("\\(Received\\|Return-Path\\|Sender\\|Errors-To\\):$" nil)
        ("\\(Message-Id\\|Posted\\|In-Reply-To\\|References\\|Precedence\\):$"
         nil)
        ("^Delivered-" nil)
        ("^List-" nil)
        ("^\\(Mime-Version\\|Lines\\):$" nil)
        ("^From$" nil)
        ("^Status:$" nil)
        ("^X-Spam-Status" nil )
        ("^X-Spam-Probabilty" nil )
        ("^X-Spam-Flag" nil)
        ("^X-Spam-Level" nil)
        ("^X-" nil mew-face-header-private mew-face-header-marginal)
        ("Resent-" nil)
        ("^Received-SPF" nil)
        )
      )
;; pour voir toutes les adresses To mettre à nil
(setq mew-use-header-veil t)
;; ----------------------------------------------- ;;



;; ----------------------------------------------- ;;
;; Gnupg

;; (setq mew-protect-privacy-always t)
;; (setq mew-protect-privacy-always-type 'pgp-signature)
;; (setq mew-use-pgp-cached-passphrase t)
;; (setq mew-pgp-server-url-template "http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x4BB3C992")
;; ----------------------------------------------- ;;

;; ----------------------------------------------- ;;
;; Grep

(setq mew-prog-grep "grep") ;; `C-u ?'
(setq mew-prog-grep-opts '("-i" "-l" "-e")) ;; '("-l" "-e")
(setq mew-prog-vgrep "grep") ;; Virtual mode
(setq mew-prog-vgrep-opts '("-i" "-l" "-e")) ;; '("-l" "-e")
;; ----------------------------------------------- ;;



;; ----------------------------------------------- ;;
;; X Mailer
(defconst mew-x-mailer
  (concat mew-version " on "
          (if (string-match "XEmacs" emacs-version) "XEmacs" "Emacs")
          (if (boundp 'emacs-program-version)
              (format " %s " emacs-program-version)
              (string-match "^\\([.0-9]+\\)\\.[0-9]+$" emacs-version)
              (concat " " (match-string 1 emacs-version) " "))
          (and (boundp 'xemacs-codename)
               (string-match "^[a-zA-Z0-9 ]+$" xemacs-codename)
               (concat "(" xemacs-codename ")"))
          (concat "/ Debian Testing")))
;; ----------------------------------------------- ;;



;; ----------------------------------------------- ;;
;; Printing mail
(setq mew-field-for-printing '("Subject:" "From:" "To:" "Cc:" "Date:"))
(setq mew-print-function 'ps-print-buffer)
;; ----------------------------------------------- ;;



;;; END ;;
