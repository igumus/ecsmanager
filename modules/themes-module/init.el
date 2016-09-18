;; Module: themes
;; File  : init.el

(let ((pname 'color-theme)
      (cname "cfg-color-theme.el"))
  (if (package-installed-p pname)
      (load-module-config cname)
    (load-module-config-with-package pname cname)))

