;; Jérôme LELONG
;; CERMICS (ENPC)
;; http://cermics.enpc.fr/~lelong
;; lelong@cermics.enpc.fr
;; Last modified: April 2006

;;;;;; for using mew ;;;;;;;;;;;


;; to handle several accounts.
;; use C to change account when in summary mode
(setq mew-config-alist
	  '(("ssh"
		 ("pop-ssl" . nil)
		 ("pop-ssh-server" . "cermics.enpc.fr")
		 ("name" . "Jérôme LELONG")
		 ("user" . "lelong")
		 ("smtp-ssh-server" . "cermics.enpc.fr")
		 ("pop-user" . "lelong")
		 ("mail-domain" . "cermics.enpc.fr")
		 ("inbox-folder" . "+inbox")
		 ("signature-file" . "~/.signature.mew")
		 ("pop-delete" . t)
		 )
		("default"
		 ("pop-ssl" . t)
		 ("pop-server" . "cermics.enpc.fr")
		 ("name" . "Jérôme LELONG")
		 ("user" . "lelong")
		 ("smtp-server" . "localhost")
		 ("pop-user" . "lelong")
		 ("mail-domain" . "cermics.enpc.fr")
		 ("inbox-folder" . "+inbox")
		 ("signature-file" . "~/.signature.mew")
		 ("pop-delete" . t)
		 )
		("inria"
		 ("pop-ssl" . t)
		 ("pop-server" . "pops-rocq.inria.fr")
		 ("name" . "Jérôme LELONG")
		 ("user" . "jerome.lelong")
		 ("smtp-server" . "localhost")
		 ("pop-user" . "lelong")
		 ("mail-domain" . "inria.fr")
		 ("inbox-folder" . "+inbox")
		 ("signature-file" . "~/.signature.mew")
		 ("pop-delete" . t)
		 )
		("neuf"
		 ("pop-ssl" . nil)
		 ("pop-server" . "pop.neuf.fr")
		 ("name" . "Jérôme LELONG")
		 ("user" . "lelong.jerome")
		 ("smtp-server" . "localhost")
		 ("pop-user" . "lelong.jerome")
		 ("mail-domain" . "neuf.fr")
		 ("inbox-folder" . "+debian")
		 ("signature-file" . "~/.signature.mew.neuf")
		 ("pop-delete" . t)
		 )
		("local"
		 ("mailbox-type" . mbox)
		 ("name" . "jl")
		 ("mbox-command-arg" . "-c -u -d /var/mail/jl")
		 ("inbox-folder" . "+system")
		)
		("gmail"
         ("name" . "Jérôme LELONG")
         ("user" . "jerome.lelong")
         ("mail-domain" . "gmail.com")
         ("pop-ssl" . t)
         ("pop-user" . "jerome.lelong@gmail.com")
         ("pop-server" . "pop.gmail.com")
         ("smtp-ssl" . t)
         ("smtp-ssl-port" . "465")
         ("smtp-user" . "jerome.lelong@gmail.com")
         ("smtp-server" . "smtp.gmail.com")
		 ("pop-delete" . nil)
		 )
		)
	  )




(setq mew-pop-port "110")
(setq mew-pop-ssl-port "995")
(setq mew-smtp-ssl-port "465")
(setq mew-prog-ssl "/usr/bin/stunnel4")
(setq mew-ssl-verify-level 0)
(setq mew-pop-auth 'pass) 
(setq mew-pop-size 0)
(setq mew-smtp-port "25")



(setq mew-auto-flush-queue t)
(setq mew-decode-broken t)

;;;;;;;;;; using mozilla as browser;;;;;;;;;;;;;

;(define-key mew-message-mode-map [mouse-2] 'browse-url-at-mouse)
(setq browse-url-netscape-program "/usr/bin/firefox")
(setq browse-url-mozilla-program "/usr/bin/firefox")
(setq thing-at-point-url-path-regexp "[~/A-Za-z0-9---_.${}#%,:]+")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq mew-signature-insert-last t)
(setq mew-signature-as-lastpart t)
(add-hook 'mew-before-cite-hook 'mew-header-goto-body)
(add-hook 'mew-draft-mode-newdraft-hook 'my-mew-draft-append-signature)
(defun my-mew-draft-append-signature ()
    (let ((mew-signature-insert-last t))
          (mew-draft-insert-signature)))

(setq mew-mailbox-type 'pop)
(setq mew-mbox-command "incm")

;;
;; Password
;;
;; WARNING: Password is stored in Emacs with RAW format.
;;
(setq mew-use-cached-passwd t) ;; nil
(setq mew-passwd-timer-unit 1) ;; 10 (minutes)
(setq mew-passwd-lifetime 300000) ;; 2

;;
;; Biff
;;
(setq mew-auto-get nil)
;(setq mew-use-biff nil) ;; nil
(setq mew-use-biff-bell nil) ;; nil
(setq mew-pop-biff-interval 1) ;; 5 (minutes)
(setq mew-biff-interval mew-pop-biff-interval) ;; for Mew 


(setq mew-mail-path "~/cermics/.Mail-Mew")
(setq mew-conf-path mew-mail-path)
(setq mew-addrbook-file "~/cermics/.Addressbook")

(setq mew-use-alternative nil)

(defvar mew-field-circular-completion-switch
    '(("To:"          . mew-circular-complete-domain)))



;;;(setq mew-decode-broken nil)
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

;; La forme originale du sommaire ne me plait pas
;;(setq mew-summary-form
;;            '(type (5 date) " " (-4 size) " " (24 from) " " t (40 subj)))

(setq mew-summary-form
	  '(type (5 date) " " (14 from) " " t (30 subj) "|" (0 body)))


(setq mew-prog-text/html         'mew-mime-text/html-w3m) ;; See w3m.el
(setq mew-prog-text/html-ext     "/usr/bin/firefox")

(setq mew-prog-text/xml         'mew-mime-text/html-w3m) ;; See w3m.el
(setq mew-prog-text/xml-ext     "/usr/bin/firefox")

(setq mew-prog-application/xml         nil)
(setq mew-prog-application/xml-ext     "/usr/bin/firefox")

;;(setq mew-prog-application/X-Dvi         "/usr/bin/xdvi")

(setq browse-url-browser-function 'browse-url-netscape) ;; Netscape
;(setq browse-url-browser-function 'browse-url-w3) ;; Emacs W3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; @ browse-url
;; autoload
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


;; unread mark
(setq mew-use-unread-mark t)  
(setq mew-unread-mark-list '((t t)))
(setq mew-delete-unread-mark-by-mark nil)

  ;; Auto-refile

(defvar mew-refile-guess-control
  '(mew-refile-guess-by-alist
	mew-refile-ctrl-auto-boundary
	mew-refile-ctrl-throw
	mew-refile-guess-by-newsgroups
	mew-refile-guess-by-folder
	mew-refile-ctrl-throw
	mew-refile-guess-by-thread
	mew-refile-ctrl-throw
	mew-refile-guess-by-from-folder
	mew-refile-ctrl-throw
	mew-refile-guess-by-from
	mew-refile-ctrl-throw
	mew-refile-guess-by-default)
  )

(setq mew-refile-guess-alist
      '(
		("From:"
		 ("delmas@cermics.enpc.fr" . "+teaching/ENSTA")
		 ("daniel@enpc.fr" . "+DIT")
		 ("roland.jarry@enpc.fr" . "+DIT")
		 ("support.linux@enpc.fr" . "+DIT")
		 ("ariel.vives@enpc.fr" . "+DIT")
		 )
		("To:"
		 ("daniel@enpc.fr" . "+DIT")
		 ("roland.jarry@enpc.fr" . "+DIT")
		 ("support.linux@enpc.fr" . "+DIT")
		 ("ariel.vives@enpc.fr" . "+DIT")
		 )
		("Subject:"
		 ("\\(ENSTA\\|MA\\ 101\\|MA204\\|MAE51\\)" . "+teaching/ENSTA")
		 ("\\(Premia\\&^Premia cvs commit\\)" . "+Premia")
		 ("Premia cvs commit" . "+Premia/cvs")
		 ("Bug#" . "+debian")
		 )
		)
	  )

;; reply citation

;; 'body --> reply before citation
;; 'end  --> reply after citation
(setq mew-summary-reply-with-citation-position 'body)
(setq mew-cite-hook 'sc-cite-original)
(setq sc-preferred-header-style 5)
(setq sc-auto-fill-region-p nil)

;; ;; when no supercite
;; (setq mew-addrbook-for-cite-label 'nickname)
;; (setq mew-draft-cite-fill-mode 'wrap)
;; (setq mew-draft-cite-label-fill-column 50)

;; (setq mew-cite-prefix-function (lambda()
;; 								 (setq prefix (mew-cite-prefix-username))
;; 								 (concat "\t test" prefix)
;; 								 )
;; 	  )
;; (setq mew-addrbook-for-cite-prefix 'nickname)
;; (setq mew-cite-fields '("From:"))
;; (setq mew-cite-format "\n\n>>>>> %s wrote:\n\n")
;; (setq mew-cite-prefix "> ")
;;(setq mew-cite-fields '("From:" "Subject:" "Date:"))
;; (setq mew-cite-format 
;; "\n\n-------- Original Message ---------\n\
;; From: %s\nSubject: %s\nDate: %s\n\n")


;; to use w3m
(setq mew-mime-multipart-alternative-list '("Text/Html" "Text/Plain" "*."))
(condition-case nil
		    (require 'mew-w3m)
		      (file-error nil))

(setq mew-mail-domain-list
      '("cermics.enpc.fr"))


;; dans affichage mew d'un mail, rendre visible X-Spam-Status
(setq mew-field-spec 
	  '(
		("^Subject:$" t mew-face-header-important mew-face-header-subject)
		("^From:$" t mew-face-header-important mew-face-header-from)
		("^\\(To\\|Apparently-To\\):$" t mew-face-header-important mew-face-header-to)
		("^\\(Cc\\|Bcc\\):$" t mew-face-header-important mew-face-header-to)
		("^Newsgroups:$" t mew-face-header-important mew-face-header-to)
		("^Date:$" t mew-face-header-important mew-face-header-date)
		("^Reply-To:$" t)
		("^X-Mailer:$" t)
		("^X-Mew:$" t mew-face-header-important mew-face-header-xmew)
		("\\(Received\\|Return-Path\\|Sender\\|Errors-To\\):$" nil)
		("\\(Message-Id\\|Posted\\|In-Reply-To\\|References\\|Precedence\\):$" nil)
		("^Delivered-" nil)
		("^List-" nil)
		("^\\(Mime-Version\\|Lines\\):$" nil)
		("^From$" nil)
		("^Status:$" nil)
		("^X-Spam-Status" t )
		("^X-Spam-Probabilty" t )
		("^X-Spam-Flag" t)
		("^X-" nil mew-face-header-private mew-face-header-marginal)
		("Resent-" nil)
		("^Received-SPF" nil)
		)
	  )
;; pour voir toutes les adresses To mettre à nil
(setq mew-use-header-veil t)


;; external application
;;(setq mew-prog-postscript      '("evince" ("") t))
;;(setq mew-prog-pdf             '("acroread" ("-geometry" "+0+0") t))

(setq mew-prog-msword '("soffice" nil t))
(setq mew-prog-msexcel '("soffice" nil t))
(setq mew-prog-mspowerpoint '("soffice" nil t))

;; Gnupg

;; (setq mew-protect-privacy-always t)
;; (setq mew-protect-privacy-always-type 'pgp-signature)
;; (setq mew-use-pgp-cached-passphrase t)
;; (setq mew-pgp-server-url-template "http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x4BB3C992")

;; Grep

(setq mew-prog-grep "grep") ;; `C-u ?'
(setq mew-prog-grep-opts '("-i" "-l" "-e")) ;; '("-l" "-e")
(setq mew-prog-vgrep "grep") ;; Virtual mode
(setq mew-prog-vgrep-opts '("-i" "-l" "-e")) ;; '("-l" "-e")

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


;; Printing mail
(setq mew-field-for-printing '("Subject:" "From:" "To:" "Cc:" "Date:"))
(setq mew-print-function 'ps-print-buffer)


;; Spam

(defun mew-bsfilter (val)
(let ((case-fold-search t))
  (if (string-match "yes" val) "+spam")))
(setq mew-scan-fields (delete mew-spam: mew-scan-fields))
(setq mew-scan-fields (delete "Body" mew-scan-fields))
(setq mew-spam: "X-Spam-Flag:")
(setq mew-scan-fields (append mew-scan-fields (list mew-spam: "Body")))
(setq mew-inbox-action-alist
      '(("X-Spam-Flag:" mew-bsfilter)))

;; for "ls" (learn-spam)
(setq mew-spam-prog "bsfilter")
(setq mew-spam-prog-args '("-C" "-s" "-u"))

;; for "lh" (learn-ham)
(setq mew-ham-prog "bsfilter")
(setq mew-ham-prog-args '("-c" "-S" "-u"))

;; for "bm" (mark-spam)
(define-key mew-summary-mode-map "bm" 'mew-summary-bsfilter-mark-region)

(defun mew-summary-bsfilter-mark-region (&optional arg)
  "study/judge the region and put the '*' mark onto spams.
need to re-learn if judgment of bsfilter is wrong"
  (interactive "P")
  (mew-pickable
   (let ((func 'mew-summary-pick-with-cmd)
         (mew-inherit-grep-cmd "bsfilter -a --list-spam"))
     (mew-summary-pick-body func t nil 'nopattern))))