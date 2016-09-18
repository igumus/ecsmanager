;; File: cfg-shell.el
;; Desc: Configuration for eshell package.

(require 'term)

(defcustom eshell-directory-name
  (let* ((dir (concat history-dir "eshell")))
    (make-directory dir t)
    dir)
  "The directory where Eshell control files should be kept."
  :type 'directory
  :group 'eshell)
