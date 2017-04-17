;; init file.

(setq root-dir user-emacs-directory)

(setq history-dir (file-name-as-directory (concat root-dir "history")))

(setq temporary-file-directory history-dir)
(setq autosaves-dir (file-name-as-directory (concat history-dir "autosaves")))
(setq auto-save-list-file-prefix (concat autosaves-dir ".saves-"))

(setq modules-dir (file-name-as-directory (concat root-dir "modules")))


(make-directory history-dir t)
(make-directory autosaves-dir t)
(make-directory modules-dir t)

;; package operations
(require 'package)

;; add default melpa packages
(add-to-list 'package-archives '("melpa"."https://melpa.org/packages/") t)

;; activate all the packages (in particular autoloads)
(package-initialize)
;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))
;; end of package operations

;; Changing yes-no to y-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Loading module.el file.
(load-file (concat root-dir "module.el"))

;; helper functions.
(defun find-modules (dir)
  (when (and (file-directory-p dir) (file-exists-p dir)) 
    (directory-files dir t "^\\([^.]\\|\\.[^.]\\|\\.\\..\\)")))

;; Load all modules.
(let* ((modules (find-modules modules-dir)))
  (if modules
      (mapc (lambda (module)
	      (load-module module))
	    modules)
    (message (concat "No modules found in : " modules-dir))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-latex-table-caption-above nil)
 '(package-selected-packages
   (quote
    (jabber company elixir-mode yasnippet elixir-yasnippets helm-projectile projectile helm ob-elixir alchemist smex paredit org-bullets magit color-theme clojure-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red"))))
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))))
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black")))))
