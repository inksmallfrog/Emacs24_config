;;init-company.el

(add-hook 'after-init-hook 'global-company-mode)
;;(add-to-list 'company-backends 'company-c-headers)
(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

(provide 'init-company)
