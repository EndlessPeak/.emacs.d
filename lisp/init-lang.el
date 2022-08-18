(with-eval-after-load 'cc-mode
  (require 'lang-cc))

;(with-eval-after-load 'org-mode
;  (require 'lang-org))
(add-hook 'org-mode-hook '(lambda() (require 'lang-org)))

(provide 'init-lang)
