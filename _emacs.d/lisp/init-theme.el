;;init-theme.el

(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes/")
(setq molokai-theme-kit t)
(load-theme 'molokai t)

(provide 'init-theme)
