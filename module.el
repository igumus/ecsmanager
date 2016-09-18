;; module.el

(defconst *module-info-file* "info.el")
(defconst *module-init-file* "init.el")
(defconst *module-cfg-dir* "config")
(defconst *module-lib-dir* "lib")

(defconst *msg-module-loading* "\n\n==> Loading Module: ")
(defconst *msg-module-info-not-exists* "#ERR: Could not found info.el file for module with location: ")
(defconst *msg-module-name-not-exists* "#ERR: No module name found. Add module name to module's info.el file")

(defvar current-module-dir  nil "Current module directory")
(defvar current-module-vsn  nil "Current module version")
(defvar current-module-name nil "Current module name")
(defvar current-module-desc nil "Current module desc")

(defun module-name (module)
  (setq current-module-name module))

(defun module-vsn (vsn)
  (setq current-module-vsn vsn))

(defun module-desc (desc)
  (setq current-module-desc desc))

(defun clear-module-info ()
  (setq current-module-name nil)
  (setq current-module-vsn nil)
  (setq current-module-desc nil))

(defun module-lib-dir ()
  (file-name-as-directory (concat current-module-dir *module-lib-dir*)))

(defun module-cfg-dir ()
  (file-name-as-directory (concat current-module-dir *module-cfg-dir*)))

(defun load-module-config (config-file)
  (load-file (concat (module-cfg-dir) config-file)))

(defun load-module (module-dir)
  (message (concat *msg-module-loading* module-dir))
  (let* ((module-dir (file-name-as-directory module-dir))
	 (module-inf (concat module-dir *module-info-file*))
	 (module-int (concat module-dir *module-init-file*)))
    (setq current-module-dir module-dir)
    (clear-module-info)
    (if (file-exists-p module-inf)
	(load-file module-inf)
      (message (concat *msg-module-info-not-exists* module-dir)))

    (add-to-list 'load-path (module-lib-dir))

    (when (file-exists-p module-int)
      (load-file module-int))

    (setq current-module-dir nil)))

;;(defconst *module-info-file* "info.el")
;;(defconst *module-init-file* "init.el")
;;(defconst *module-cfg-dir* "config")
;;(defconst *module-lib-dir* "lib")

(defun module-create-files-fn (module-name module-dir)
  (let ((files (mapcar (lambda (file) (concat module-dir file)) (list *module-info-file* *module-init-file*))))
    (mapcar
     (lambda (file)
       (with-temp-buffer
	 "tmp-module"
	 (erase-buffer)
	 (insert (concat ";; Module: " module-name))
	 (insert (concat "\n;; File  : " (file-name-nondirectory file)))
	 (append-to-file nil (point-max) file)
	 (kill-buffer)
	 )
       )
     files)))


(defun module-create ()
  (interactive)
  (let* ((mname (read-string "Module Name: "))
	 (mdir (file-name-as-directory (concat modules-dir mname)))
	 (cdir (file-name-as-directory (concat mdir *module-cfg-dir*)))
	 (ldir (file-name-as-directory (concat mdir *module-lib-dir*)))
	 )
    (make-directory mdir t)
    (make-directory cdir t)
    (make-directory ldir t)
    (module-create-files-fn mname mdir)
    (message (concat mname " module created under " modules-dir))))
	
