;; Module: yasnippet-module
;; File  : init.el

(let ((pname 'color-theme)
      (cname "cfg-yasnippet.el"))
  (if (package-installed-p pname)
      (load-module-config cname)
    (load-module-config-with-package pname cname)))

