;; File: cfg-color-theme.el
;; Desc: Configuration for color-theme package.
;;       Required customizations cyberpunk.el and gandalf.el files located under lib folder.

(require 'color-theme)

;; use blackbored colour theme
(load-file (concat (module-lib-dir) "cyberpunk.el"))
(load-file (concat (module-lib-dir) "gandalf.el"))

;;(color-theme-cyberpunk)
(color-theme-gandalf)
(set-cursor-color "yellow")
