;; File: cfg-package.el
;; Desc: Extend functionality of package.el, and added global keybindings.

(require 'package)
(require 'cl)

;; ;;;###autoload
(defun package-archive-add-fn (key url)
  "Adds key-url pair to package-archives variable"
  (let ((cell (cons key url)))
    (when (not (member cell package-archives))
      (add-to-list 'package-archives cell t))))

(package-archive-add-fn "melpa" "https://melpa.org/packages/")

(defun package-archive-del-fn (key)
  "Removes package archive defined with key as parameter"
  (setq package-archives
	(remove-if (lambda (repo)
		     (string= key (car repo)))
		   package-archives)))

(defun package-archive-list ()
  "Shows content of registered package archives.\nPrints archive list in key => url format."
  (interactive)
  (let ((archives (mapcar
		   (lambda (p) (concat (car p) " => " (cdr p)))
		   package-archives)))
    (message (format "%s" archives))
    archives))

(defun package-archive-add ()
  "Adds package archive to package archives list"
  (interactive)
  (let ((repo-key (read-string "Package Archive Key To Add:"))
	(repo-url (read-string "Package Archive URL To Add:")))
    (package-archive-add-fn repo-key repo-url)
    (message (concat repo-key " Added to Package Archive List"))))

(defun package-archive-del ()
  "Removes package archive from package archive repository"
  (interactive)
  (let ((repo-key (read-string "Package Archive Key To Del:")))
    (package-archive-del-fn repo-key)
    (message "Package Archive Removal Done")))


;; KEYBINDINGS (KBD) OF PACKAGE-MANAGER
;;
;; kbd for package-archive-list
(global-set-key (kbd "C-c p l") 'package-archive-list)
;; kbd for package-archive-add
(global-set-key (kbd "C-c p a") 'package-archive-add)
;; kbd for package-archive-del
(global-set-key (kbd "C-c p d") 'package-archive-del)
