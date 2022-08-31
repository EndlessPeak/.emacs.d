(use-package yasnippet
  :ensure t
  :hook (after-init . yas-global-mode)
  :config
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets")))

(use-package doom-snippets
  :load-path "~/.emacs.d/elpa/snippets"
  :after yasnippet
  )

;;(use-package yasnippet-snippets
;;  :ensure nil
;;  :defer t)

(use-package company
  :ensure t
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook ((after-init . global-company-mode))
  :bind
  (:map company-active-map
        ("<tab>" . company-select-next)
        ("<backtab>" . company-select-previous))
  :commands (company-complete-common
             company-complete-common-or-cycle
             company-manual-begin
             company-grab-line)
  :config
  (setq ;;company-dabbrev-code-everywhere t
        ;;company-dabbrev-code-modes t
        ;;company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil
        company-dabbrev-other-buffers 'all
        company-require-match 'never
        company-minimum-prefix-length 2
        company-show-numbers t
        company-tooltip-limit 10
        company-idle-delay 0
        company-echo-delay 0
        company-tooltip-offset-display 'scrollbar
        company-begin-commands '(self-insert-command)
        company-backends '((company-yasnippet company-capf)))
  ;;The code above can only show one type of complete method. 
  ;;Use the code blow can show code-complete with yasnippet at the same time
  ;;(push '(company-semantic :with company-yasnippet) company-backends)
  ;;(push '(company-capf :with company-yasnippet) company-backends)
  ;;Refer to the doom emacs method,both can be shown at the same time.
  ;;See `init-lang.el'
  )

;;company-yasnippet disable after dot
(defun company-yasnippet/disable-after-dot (fun command &optional arg &rest _ignore)
(if (eq command 'prefix)
    (let ((prefix (funcall fun 'prefix)))
        (when (and prefix (not (eq (char-before (- (point) (length prefix)))
                            ?.)))
        prefix))
    (funcall fun command arg)))

(advice-add #'company-yasnippet :around #'company-yasnippet/disable-after-dot)
(provide 'init-complete)
