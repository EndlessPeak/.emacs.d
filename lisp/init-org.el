(use-package org
  :ensure t
  :defer t
  :config
  (org-indent-mode)
  (setq org-hide-leading-stars t
        org-hide-emphasis-markers t
        org-startup-indented t))

;; org-superstar
;; make the org mode more beautiful with optimized leading chars
(use-package org-superstar
  :ensure t
  :defer t
  :hook (org-mode . org-superstar-mode)
  :config (setq org-superstar-prettify-item-bullets nil))


(add-hook 'org-mode-hook (lambda ()
                            (setcar (nthcdr 0 org-emphasis-regexp-components)
                                    "-[:multibyte:][:space:]('\"{")
                            (setcar (nthcdr 1 org-emphasis-regexp-components)
                                    "-[:multibyte:][:space:].,:!?;'\")}\\[")
                            (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
                            (org-element-update-syntax)
                            ;; 规定上下标必须加 {}，否则中文使用下划线时它会以为是两个连着的下标
                            (setq org-use-sub-superscripts "{}")))

(use-package valign
  :ensure t
  :defer t
  :hook (org-mode . valign-mode))
;(require 'valign)
;(add-hook 'org-mode-hook #'valign-mode)
(provide 'init-org)
