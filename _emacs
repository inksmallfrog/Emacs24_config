;;; package --- Summary
;;; Commentary:

;;; Code:
;;-----------------------Functions----------------------
;;FullScreen
;;from http://www.cnblogs.com/chinazhangjie/archive/2011/06/01/2067263.html
(defun my-fullscreen ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

(defun ska-point-to-register()   
"Store cursorposition _fast_ in a register.   
Use ska-jump-to-register to jump back to the stored   
position."   
(interactive)   
(setq zmacs-region-stays t)   
(point-to-register 8))   

(defun ska-jump-to-register()   
"Switches between current cursorposition and position   
that was stored with ska-point-to-register."   
(interactive)   
(setq zmacs-region-stays t)   
(let ((tmp (point-marker)))
(jump-to-register 8)   
(set-register 8 tmp)))   
;;--------------------------END-------------------------

;;----------------------Extensions----------------------
;;-------------------------irony------------------------
;;from https://github.com/Sarcasm/irony-mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;;--------------------------end-------------------------

;;----------------------autoComplete--------------------
;;from http://auto-complete.org/doc/manual.html#installation
;;(require 'auto-complete-config)
;;(ac-config-default)
;;--------------------------end-------------------------

;;---------------------company-mode---------------------
(add-hook 'after-init-hook 'global-company-mode)
;;--------------------------end-------------------------
;;--------------------------END-------------------------


;;------------------------Common------------------------
;;---------------------PrepareElpa----------------------
(require 'package)
(add-to-list 'package-archives'
  ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives' 
  ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
  ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
;;-------------------------end--------------------------

;;----------------------UserInfo------------------------
(setq user-full-name "inksmallfrog")
(setq user-mail-address "inksmallfrog@gmail.com")
;;------------------------end---------------------------

;;-----------------------theme--------------------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'molokai t)
;;------------------------end---------------------------

;;-----------------------cstyle-------------------------
(add-to-list 'load-path (expand-file-name "~/.emacs.d/style")) 
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent) 
;;------------------------end---------------------------

;;----------------------autopair------------------------
(require 'electric)
(electric-pair-mode t)
;;------------------------end---------------------------

;;--------------------Preference------------------------
;;from http://www.cnblogs.com/chinazhangjie/archive/2011/06/01/2067263.html
;;from http://blog.csdn.net/horstlinux/article/details/7772831
(global-font-lock-mode t)                       ;;highlight syntax
(setq column-number-mode t)                     ;;show column number
(setq line-number-mode t)                       ;;show line number
(fset 'yes-or-no-p 'y-or-n-p)                   ;;use 'y/n' replaces 'yes/no'
(setq scroll-margin 3 scroll-conservatively 10000);;set scroll velocity
(setq inhibit-startup-message t)                ;;remove start scene
(tool-bar-mode -1)                              ;;remove tool bar
(menu-bar-mode -1)                              ;;remove menu bar
(scroll-bar-mode -1)                            ;;remove scroll bar
(setq make-backup-files -1)
(transient-mark-mode t)    
(setq visible-bell -1)  
(setq fill-column 80)                   ;;set max column
(setq frame-title-format "inksmallfrog@%b")     ;;show current doc
(which-function-mode t)                 ;在状态条上显示当前光标在哪个函数体内部  
(auto-compression-mode 1)               ;打开压缩文件时自动解压缩 
(setq major-mode 'text-mode)            ;;use text-mode as default
;;brankets matching
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;show time
(display-time-mode 1) 
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t) 

;;------------------------end---------------------------

;;---------------------KeySetting-----------------------
(global-set-key [f1] 'shell);F1进入Shell
(global-set-key [f11] 'my-fullscreen) ;;F11: show emacs with fullscreen mode
;;;C-.来在当前位置做个标记  
;;用C-,就回到刚才做标记的地方A，再用C-,又会回到B   
(global-set-key [(control ?.)] 'ska-point-to-register)
(global-set-key [(control ?,)] 'ska-jump-to-register) 
;;------------------------end---------------------------

;;--------------------- 编码设置-------------------------
;;from http://blog.csdn.net/horstlinux/article/details/7772831
(setq buffer-file-coding-system 'utf-8-unix)            ;缓存文件编码
(setq default-file-name-coding-system 'utf-8-unix)              ;文件名编码
(setq default-keyboard-coding-system 'utf-8-unix)               ;键盘输入编码
(setq default-process-coding-system '(utf-8-unix . utf-8-unix)) ;进程输出输入编码
(setq default-sendmail-coding-system 'utf-8-unix)               ;发送邮件编码
(setq default-terminal-coding-system 'utf-8-unix)               ;终端编码
;;------------------------end---------------------------

;;--------------------- 缩进设置 -----------------------
;;from http://blog.csdn.net/horstlinux/article/details/7772831
(setq tab-width 4)              ;设置TAB默认的宽度
(dolist (hook (list                     ;设置用空格替代TAB的模式
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook
               ))
  (add-hook hook '(lambda () (setq indent-tabs-mode nil))))
;;------------------------end---------------------------
;;------------------------END---------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; .emacs ends here
