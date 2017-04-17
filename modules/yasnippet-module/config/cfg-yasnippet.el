
;; use blackbored colour theme
(let ((dir (concat (module-lib-dir) "snippets")))
  (add-hook 'elixir-mode-hook 'alchemist-mode)
  (add-hook 'erlang-mode-hook 'alchemist-mode)
  (require 'yasnippet)
  (yas-load-directory dir)
  (setq yas-global-mode t))
