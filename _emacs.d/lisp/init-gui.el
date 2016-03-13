;;init-personal.el

(setq inhibit-startup-message t)  ;;关闭欢迎界面
(setq gnus-inhibit-startup-message nil)

(global-linum-mode t)

;;关闭gui显示
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(provide 'init-gui)
