;; File: cfg-org-mode.el
;; Desc: Configurations and customizations for org-mode package.

;; Record the time that a todo was archived.
(setq org-log-done 'time)

;; Exporting Org-Mode to HTML
;; Don’t include a footer with contact and
;;publishing information at the bottom of every exported HTML document.
(setq org-html-postamble nil)

;; Uses the current window rather than popping open a new one (which is the same).
(setq org-src-window-setup 'current-window)

;; Uses syntax highlighting in source blocks while editing.
(setq org-src-fontify-natively t)

;; Setting org directory
(setq org-directory "~/Documents/Org")

(defun org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))

(setq org-inbox-file (org-file-path "inbox.org"))
(setq org-index-file (org-file-path "index.org"))
(setq org-archive-location
      (concat (org-file-path "archive.org") "::* From %s"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (sh . true)
   (gnuplot . t)))

(setq org-capture-templates
      '(("l" "Today I Learned..."
         entry
         (file+datetree (org-file-path "til.org"))
         "* %?\n")

        ("r" "Reading"
         checkitem
         (file (org-file-path "to-read.org")))

        ("t" "Todo"
         entry
         (file org-index-file)
         "* TODO %?\n")))

(defun open-index-file ()
  "Open the master org TODO list."
  (interactive)
  (find-file org-index-file)
  (end-of-buffer))



;; Keybindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c i") 'open-index-file)
