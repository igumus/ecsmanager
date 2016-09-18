;; Module: org-module
;; File  : init.el

(load-module-config "cfg-org-mode.el")

(let ((pname 'org-bullets)
      (cname "cfg-org-bullets.el"))
  (if (package-installed-p pname)
      (load-module-config cname)
    (load-module-config-with-package pname cname)))
