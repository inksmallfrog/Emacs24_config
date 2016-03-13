;;init-auto-complete.el

(require-package 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

(setq tab-always-indent 'complete)

(setq-default ac-epand-on-auto-complete nil)
(setq-default ac-auto-start nil)
(ac-set-trigger-key "TAB")

(after-load 'init-yasnippet
    (set-default 'ac-sources
                  '(ac-source-dictionary
                     ac-source-words-in-buffer
                     ac-source-words-in-same-mode-buffers
                     ac-source-words-in-all-buffer
                     ac-source-functions
                     ac-source-yasnippet)))

(require 'init-ac-source)
(provide 'init-auto-complete)
