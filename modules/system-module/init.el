;; Module: system
;; File  : init.el

(load-module-config "cfg-package.el")
(load-module-config "cfg-bell.el")
(load-module-config "cfg-system-kbd.el")
(load-module-config "cfg-ui.el")
(load-module-config "cfg-buffer-move.el")
(load-module-config "cfg-shell.el")
(load-module-config "cfg-personal.el")


;(let ((pname 'smex)
;(cname "cfg-smex.el"))
;(if (package-installed-p pname)
;(load-module-config cname)
;(load-module-config-with-package pname cname)))
