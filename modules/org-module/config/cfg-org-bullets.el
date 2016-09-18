;; File: cfg-org-bullets.el
;; Desc: Configuration of org-bullets.

(add-hook 'org-mode-hook
	  (lambda ()
	    (org-bullets-mode t)))


;; define bullet symbols.
(setq bullet-circles         '("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙" "∘"))
(setq bullet-special-circles '("◐" "◑" "◒" "◓" "◴" "◵" "◶" "◷" "⚆" "⚇" "⚈" "⚉" "♁" "⊖" "⊗" "⊘"))
(setq bullet-special-symbols '("☀" "♼" "☼" "☾" "☽" "☣" "§" "¶" "‡" "※" "✕" "△" "◇" "▶" "◀" "◈"))

;; define ellipsis'
(setq ellipsis-rounded-down-arrow "⤵")
(setq ellipsis-lightening "⚡")
(setq ellipsis-down-triangle "▼")
(setq ellipsis-down-arrow "↴")

(require 'org-bullets)

;; bullet-circles and ellipsis-rounded-down-arrow are default ones.

(setq org-bullets-bullet-list bullet-circles)
(setq org-ellipsis ellipsis-rounded-down-arrow)
