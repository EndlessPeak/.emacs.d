;; Initialize package sources
(require 'package)
;; Package initialize occurs automatically, before `user-init-file' is
;; loaded, but after `early-init-file'. We handle package
;; initialization, so we must prevent Emacs from doing it early!
(setq package-enable-at-startup nil)

(setq package-archives '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			             ))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; set `use-package' variables
(setq use-package-always-ensure t
      use-package-always-defer nil
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

;; Update GPG keyring for GNU ELPA
(use-package gnu-elpa-keyring-update)

;; Auto update packages
(unless (fboundp 'package-upgrade-all)
  (use-package auto-package-update
  :init
  (setq auto-package-update-delete-old-versions t
          auto-package-update-hide-results t)
  (defalias 'upgrade-packages #'auto-package-update-now)))

(provide 'init-package)
