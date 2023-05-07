;; org-mode snippets中
;; %Y 表示年
;; %m 表示月 %B 表示英文显示的月
;; %d 表示日期
;; %A 表示周 %a 表示短写周

;; 插入日程日期应为 org-time-stamp
(use-package org
  :ensure t
  :defer t
  :config
  (org-indent-mode t)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)
  (org-toggle-inline-images)
  (setq org-hide-leading-stars t
        org-hide-emphasis-markers t
        org-startup-indented t))

;; (org-babel-do-load-languages
;;    'org-babel-load-languages
;;    '((emacs-lisp . t)
;;      (json . t)
;;      (cpp . t)
;;      (python . t)))

;; ;; org-superstar
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
  ;; org-at-heading-or-items-p
  ;;(evil-define-key 'insert 'evil-org-mode
  ;;  (kbd "TAB") 'org-metaright
  ;;  (kbd "<backtab>") 'org-metaleft)
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

;; Standardize the tabel width in different fonts
(use-package valign
  :ensure t
  :defer t
  :hook (org-mode . valign-mode))
;(require 'valign)
;(add-hook 'org-mode-hook #'valign-mode)

(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :defer t
  ;;:pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)

;; Org-tree-slide 
(defun leesin/org-tree-slide-presentation-setup()
  ;; Cannot set unicode amount
  (setq text-scale-mode-amount 3)
  (org-display-inline-images)
  (text-scale-mode 1)
  ;;(text-scale-adjust 1)
  )

(defun leesin/org-tree-slide-presentation-end()
  (text-scale-mode 0)
  )

(use-package org-tree-slide
  :ensure t
  :defer t
  :hook ((org-tree-slide-play . leesin/org-tree-slide-presentation-setup)
         (org-tree-slide-stop . leesin/org-tree-slide-presentation-end))
  :custom
  (org-tree-slide-slide-in-effect t)
  (org-tree-slide-activate-message "Presentation started!")
  (org-tree-slide-deactivate-message "Presentation finished!")
  (org-tree-slide-header t)
  (org-tree-slide-breadcrumbs " > ")
  (org-image-actual-width nil))

;; Set margin for org-present
(defun leesin/org-mode-visual-fill()
  (setq visual-fill-column-width 80
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(defun leesin/org-mode-visual-fill-quit()
  ;;(setq visual-fill-column-width 0
  ;;      visual-fill-column-center-text nil)
  (visual-fill-column-mode 0))

(use-package visual-fill-column
  :ensure t
  :defer t
  :hook ((org-present-mode . leesin/org-mode-visual-fill)
         (org-present-mode-quit . leesin/org-mode-visual-fill-quit)))

;; Org-present Configuration
(defun leesin/org-present-prepare-slide()
  (org-overview)
  (org-show-entry)
  (org-show-children))

(defun leesin/org-present-hook()
  (display-line-numbers-mode nil)
  (setq-local face-remapping-alist '((header-line (:height 4.0) variable-pitch)))
  (setq text-scale-mode-amount 1)
  (text-scale-mode 1)
  (setq header-line-format " ")
  (org-display-inline-images)
  (leesin/org-present-prepare-slide))

(defun leesin/org-present-quit-hook()
  (display-line-numbers-mode t)
  (text-scale-mode 0)
  (setq header-line-format nil)
  (org-remove-inline-images))

(defun leesin/org-present-prev()
  (interactive)
  (org-present-prev)
  (leesin/org-present-prepare-slide))

(defun leesin/org-present-next()
  (interactive)
  (org-present-next)
  (leesin/org-present-prepare-slide))

(use-package org-present
  :bind (:map org-present-mode-keymap
         ("C-c C-j" . leesin/org-present-next)
         ("C-c C-k" . leesin/org-present-prev))
  :hook ((org-present-mode . leesin/org-present-hook)
         (org-present-mode-quit . leesin/org-present-quit-hook)))

(setq org-agenda-files '("~/Documents/org/tasks.org"))
;;(setq org-agenda-files '(list "~/Documents/org/tasks.org"
;;                              "~/Documents/org/test.org"))

(provide 'init-org)
