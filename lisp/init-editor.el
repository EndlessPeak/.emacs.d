;; A few more useful configurations
;; Add from package `vertico'
(use-package emacs
  :ensure t
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t)
  :config
  ;; Simplify confirm process
  (defalias 'yes-or-no-p 'y-or-n-p)
  )

;; Show line number
;;(setq display-line-numbers-type 't)
;;(setq display-line-numbers 'absolute)
(use-package display-line-numbers
  :ensure t
  :config
  (global-display-line-numbers-mode t)
  ;; line number align right
  :init
  (setq display-line-numbers-width-start t)
  )

(provide 'init-editor)
