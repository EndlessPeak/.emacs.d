(require 'init-variable) ;;need lsp parameters

(use-package rust-mode
  :ensure t
  :defer t)

(use-package flycheck
  :ensure nil
  ;;:hook (after-init . global-flycheck-mode)
  )

(use-package lsp-mode
  :ensure t
  :defer t
  :hook ((prog-mode . (lambda ()
                        ;; Ask lsp mode load
                        (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'makefile-mode 'snippet-mode)
                          (lsp-deferred))))
         (lsp-mode . (lambda ()
                       ;; Intergrate `which-key'
                       (lsp-enable-which-key-intergration)

                       ;; Format and organize imports
                       (when (and leesin-lsp-format-on-save
                                  (not (apply #'derived-mode-p leesin-lsp-format-on-save-ignore-modes)))
                         (add-hook 'before-save-hook #'lsp-format-buffer t t)
                         (add-hook 'before-save-hook #'lsp-organize-imports t t))))
                       )
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-prefer-flymake nil)
  (setq lsp-prefer-capf t)
  (setq lsp-enable-snippet t)
  (setq lsp-enable-completion-at-point t)
  (setq lsp-keep-workspace-alive nil)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-enable-semantic-highlighting nil)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-text-document-color nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-indentation nil)
  (setq lsp-enable-on-type-formatting nil)
  ;;Reset company backends
  ;;In this way can emacs show company-yasnippet
  ;;Refered from doom-emacs
  (add-hook 'lsp-completion-mode-hook (lambda ()
                                        (when lsp-completion-mode
                                          (set (make-local-variable 'company-backends)
                                               (remq 'company-capf company-backends)))))
  :commands (lsp lsp-deferred)
  )

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config (setq lsp-ui-flycheck-enable t)
  :commands lsp-ui-mode)

(with-eval-after-load 'cc-mode
  (require 'lang-cc))

(with-eval-after-load 'json-mode
  (require 'lang-json))

;(with-eval-after-load 'org-mode
;  (require 'lang-org))
;(add-hook 'org-mode-hook '(lambda() (require 'lang-org)))

(provide 'init-lang)
