;; module.el

;; loading module-log.el file.
(load-file (concat root-dir "module-log.el"))

(defconst *module-info-file* "info.el")
(defconst *module-init-file* "init.el")
(defconst *module-cfg-dir*   "config")
(defconst *module-lib-dir*   "lib")

(defvar active-module-list  nil "Holds active (loaded) module list")
(defvar passive-module-list nil "Holds passive (not-loaded) module list")

(defvar current-module-dir  nil "Current module directory")
(defvar current-module-vsn  nil "Current module version")
(defvar current-module-name nil "Current module name")
(defvar current-module-desc nil "Current module desc")
(defvar current-module-al   nil "Current module auto load")
(defvar current-module-api  nil "Current module need auto package installation")

(defun module-name (module)
  (setq current-module-name module))

(defun module-vsn (vsn)
  (setq current-module-vsn vsn))

(defun module-desc (desc)
  (setq current-module-desc desc))

(defun module-api ()
  (setq current-module-api t))

(defun module-al ()
  (setq current-module-al t))

(defun clear-module-info ()
  (setq current-module-name nil)
  (setq current-module-vsn  nil)
  (setq current-module-desc nil)
  (setq current-module-api  nil)
  (setq current-module-al   nil)
  )

(defun module-lib-dir (&optional current-dir)
  (unless current-dir (setq current-dir current-module-dir))
  (when current-dir
    (file-name-as-directory (concat current-dir *module-lib-dir*))))

(defun module-cfg-dir ()
  (file-name-as-directory (concat current-module-dir *module-cfg-dir*)))

(defun load-module-config (config-file)
  (load-file (concat (module-cfg-dir) config-file)))

(defun load-module-config-with-package (pname cname)
  (warn-module-package pname cname)
  (when current-module-api
    (package-install pname)
    (load-module-config cname)))

(defun find-module (search-name module-list)
  (when module-list
    (let* ((module (car module-list))
	   (module-name (car module)))
      (if (string-suffix-p search-name module-name t)
	  module
	(find-module search-name (cdr module-list))))))

(defun activate-module (module-name)
  (let* ((module (find-module module-name passive-module-list))
	 (module-path (file-name-as-directory (cdr module))))
    (if module
	(progn
	  (load-module module-path t)
	  (add-to-list 'active-module-list module)
	  (setq passive-module-list (remove module passive-module-list))
	  )	  
      (err-module (concat module-name " not found in passive module list")))))

(defun load-module (module-dir &optional autoload)
  (info-module-loading module-dir)
  (let* ((module-dir (file-name-as-directory module-dir))
	 (module-inf (concat module-dir *module-info-file*))
	 (module-int (concat module-dir *module-init-file*)))
    (setq current-module-dir module-dir)

    (if (file-exists-p module-inf)
	(progn
	  (load-file module-inf)
	  (if (or current-module-al autoload)
	      (progn
		;; add lib dir of module when it exists.
		(when (file-exists-p (module-lib-dir))
		  (add-to-list 'load-path (module-lib-dir)))
		
		;; load init.el file of module when it exists.
		(when (file-exists-p module-int)
		  (load-file module-int))
		(add-to-list 'active-module-list (cons current-module-name module-dir))
		)
	    (add-to-list 'passive-module-list (cons current-module-name module-dir)))
	  )
      (err-module-info module-dir))
    
    (setq current-module-dir nil)
    (clear-module-info)))

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
    (info-module (concat mname " module created under " modules-dir))))
	
