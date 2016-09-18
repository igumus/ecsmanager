;; File: cfg-smex.el
;; Desc: Configuration and keybinding settings for  smex package.

(require 'smex)

;; set smex-save-file var before initialize smex.
(setq smex-save-file
      (let* ((dir (file-name-as-directory (concat history-dir "smex"))))
	(make-directory dir t)
	(concat dir "smex-items")))

(smex-initialize)

;; KEYBINDINGS FOR smex.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

