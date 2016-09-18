(add-to-list 'load-path "~/.emacs.d/config/")

(load "cfg-global.el")
(load "cfg-package.el")

(when (package-installed-p 'magit)
  (load "cfg-magit.el"))

(when (package-installed-p 'shell-switcher)
  (load "cfg-shell-switcher.el"))

(when (package-installed-p 'erlang)
  (load "cfg-erl-mode.el"))

(when (package-installed-p 'undo-tree)
  (load "cfg-undo-tree.el"))

(when (package-installed-p 'nlinum)
  (load "cfg-nlinum.el"))

(when (package-installed-p 'powerline)
  (load "cfg-powerline.el"))
