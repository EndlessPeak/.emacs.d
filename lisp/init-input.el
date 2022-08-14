(use-package fcitx
  :ensure t
  :config
  (setq fcitx-use-dbus nil
	fcitx-remote-command "fcitx5-remote")
  (fcitx-aggressive-setup))



(provide 'init-input)
