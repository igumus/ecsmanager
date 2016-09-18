(require 'shell-switcher)

(setq shell-switcher-mode t)

(define-key shell-switcher-mode-map (kbd "C-'")
            'shell-switcher-switch-buffer)
