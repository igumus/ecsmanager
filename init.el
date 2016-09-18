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
