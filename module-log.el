;; module-msg.el


(defun warn-module (message)
  (message (format "### WARN: %s" message)))


(defun err-module (message)
  (message (format "### ERR: %s" message)))

(defun info-module (mname)
  (message (format "\n\n### INFO: %s" mname)))

(defun warn-module-package (pname cname)
  (let ((pname (if (symbolp pname) (symbol-name pname) pname)))
    (warn-module (format "%s not installed so %s not loaded." pname cname))))

(defun err-module-info (location)
  (err-module (format "Could not found info.el file for module with location %s" location)))

(defun err-module-name ()
  (err-module (format "No module name attribute found. Add module name to module's info.el file")))

(defun info-module-loading (mname)
  (info-module (format "==> Loading Module: %s" mname)))
