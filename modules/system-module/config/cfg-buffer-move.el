;; File: cfg-buffer-move.el
;; Desc: Keybinding settings for buffer-move package that located under lib folder.


(require 'buffer-move)
(global-set-key (kbd "C-c w p") 'buf-move-up)
(global-set-key (kbd "C-c w n") 'buf-move-down)
(global-set-key (kbd "C-c w j") 'buf-move-left)
(global-set-key (kbd "C-c w f") 'buf-move-right)
