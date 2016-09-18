;; File: cfg-ui.el
;; Desc: Configuration of ui elements.

(menu-bar-mode -1)
(tool-bar-mode -1)

(when window-system
  (scroll-bar-mode -1)
  (setq frame-title-format "emacs")
  (global-hl-line-mode))
