;;init-cstyle.el
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(provide 'init-cstyle)
