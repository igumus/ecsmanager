(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; If major version is less than 24
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(magit erlang shell-switcher undo-tree nlinum))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

