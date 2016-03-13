;;https://learnxinyminutes.com/docs/elisp/
;;把目录lisp添加到搜索路径
(add-to-list
  'load-path
  (expand-file-name "lisp" user-emacs-directory))

;;下面每一个被require的feature都对应一个lisp/目录下的同名
;;elisp文件，例如init-utils.el、init-elpa.el
(require 'init-utils)  ;;初始化
(require 'init-elpa)  ;;ELPA
(require 'init-fonts)  ;;字体
;;(require 'init-editing-utils)  ;;小工具
(require 'init-gui)
(require 'init-showtime)
(require 'init-theme)

;;other plugins
(require 'init-irony)
(require 'init-pair)
(require 'init-cstyle)
(require 'init-company)
;;(require 'init-auto-complete)
(require 'init-yasnippet)
(require 'init-markdown)
;;(require 'init-auctex)
(require 'init-ido)
(require 'init-smex)
(require 'init-flyspell)
(require 'init-flymake)
(require 'init-org)
(require 'init-func)

(provide 'init)
