;; File: cfg-system-kbd.el
;; Desc: System wide keybinding.

;; C-c groups
;; C-c w window sizing.
(global-set-key (kbd "C-c w .") 'shrink-window-horizontally)
(global-set-key (kbd "C-c w ,") 'enlarge-window-horizontally)

;; increase text size.
(global-set-key (kbd "C-+") 'text-scale-increase)

;; decrease text size.
(global-set-key (kbd "C--") 'text-scale-decrease)



