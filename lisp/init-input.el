(when sys/linux
  (use-package fcitx
    :ensure t
    :config
    (setq fcitx-use-dbus nil
    fcitx-remote-command "fcitx5-remote")
    (fcitx-aggressive-setup))
)

(use-package pangu-spacing
  :ensure t
  ;:hook (text-mode . pangu-spacing-mode)
  :config
  (global-pangu-spacing-mode 1)
  ;; Always insert `real' space in org-mode.
  (add-hook 'org-mode-hook
            #'(lambda ()
               (set (make-local-variable 'pangu-spacing-real-insert-separtor) t))))
  
(provide 'init-input)
