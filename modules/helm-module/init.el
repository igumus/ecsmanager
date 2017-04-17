;; Module: helm-module
;; File  : init.el

(let ((pname 'helm)
      (cname "cfg-helm.el"))
  (if (package-installed-p pname)
      (load-module-config cname)
    (load-module-config-with-package pname cname)))


