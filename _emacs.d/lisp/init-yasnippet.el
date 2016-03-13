;;init-tasnippet.el

(require-package 'yasnippet)
(require 'yasnippet)

;; 使用Ctrl-c k为触发键
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

(yas-global-mode t)

(provide 'init-yasnippet)
