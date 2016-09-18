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
(setq org-directory "~/Org")

