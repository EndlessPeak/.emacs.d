(use-package flycheck
  :ensure nil
  ;;:hook (after-init . global-flycheck-mode)
  )

(use-package lsp-mode
  :ensure t
  :defer t
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-prefer-flymake nil)
  :hook ((c++-mode . lsp-deferred)
         ;;(lsp-mode . lsp-enable-which-key-intergration)
         )
  :commands (lsp lsp-deferred)
  )

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config (setq lsp-ui-flycheck-enable t)
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure t
  :after lsp-mode
  :commands lsp-treemacs-errors-list)

(with-eval-after-load 'cc-mode
  (require 'lang-cc))

;(with-eval-after-load 'org-mode
;  (require 'lang-org))
;(add-hook 'org-mode-hook '(lambda() (require 'lang-org)))

(provide 'init-lang)
