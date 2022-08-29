(use-package yasnippet
  :ensure t
  :defer t
  :hook (after-init . yas-global-mode)
  :config
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets")))

(use-package yasnippet-snippets
  :ensure t
  :defer t)

(use-package company
  :ensure t
  :hook ((after-init . global-company-mode))
  :bind
  (:map company-active-map
        ("<tab>" . company-select-next)
        ("<backtab>" . company-select-previous))
  :config
  (setq company-dabbrev-code-everywhere t
        company-dabbrev-code-modes t
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-dabbrev-other-buffers 'all
        company-require-match nil
        company-minimum-prefix-length 3
        company-show-numbers t
        company-tooltip-limit 10
        company-idle-delay 0
        company-echo-delay 0
        company-tooltip-offset-display 'scrollbar
        company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  )

(provide 'init-complete)
