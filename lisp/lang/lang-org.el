(use-package org
  :ensure t
  :config
  (org-indent-mode)
  (setq org-hide-leading-stars t
        org-hide-emphasis-markers t
        org-startup-indented t))

;; org-superstar
;; make the org mode more beautiful with optimized leading chars
(use-package org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode)
  :config (setq org-superstar-prettify-item-bullets nil))


(provide 'lang-org)
