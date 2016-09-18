;; Module: git-module
;; File  : init.el

(let ((pname 'magit)
      (cname "cfg-magit.el"))
  (if (package-installed-p pname)
      (load-module-config cname)
    (load-module-config-with-package pname cname)))


