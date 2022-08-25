(use-package org
  :ensure t
  :defer t
  :config
  (org-indent-mode t)
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

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . evil-org-mode)
  :config
  (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))
  ;;(add-hook 'evil-org-mode-hook #'evil-normalize-keymaps)
  ;;(evil-org-set-key-theme)
  (evil-define-key 'insert 'evil-org-mode
    (kbd "TAB") 'org-metaright
    (kbd "<backtab>") 'org-metaleft)
  (evil-define-key 'normal 'evil-org-mode
    (kbd "O") 'evil-open-above)
  )
  
;;(use-package org-modern
;;  :ensure t
;;  :defer t
;;  :hook
;;  ((org-mode . org-modern-mode)
;;        (org-agenda-finalize . org-modern-agenda)
;;        (org-modern-mode . (lambda ()
;;                            "Adapt `org-modern-mode'."
;;                            ;; Disable Prettify Symbols mode
;;                            (setq prettify-symbols-alist nil)
;;                            (prettify-symbols-mode -1)
;;                            )))
;;  )

(use-package valign
  :ensure t
  :defer t
  :hook (org-mode . valign-mode))
;(require 'valign)
;(add-hook 'org-mode-hook #'valign-mode)

(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  ;;:pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)

(provide 'init-org)
