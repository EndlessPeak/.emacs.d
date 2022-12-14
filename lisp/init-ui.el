;; Font
;; Set Emacs Font for linux and windows operating system
;; (set-face-attribute 'default nil :font "JetbrainsMono Nerd Font" :height 120)
(when *is-linux*
  (set-face-attribute 'default nil :font (font-spec :family "SauceCodePro Nerd Font" :size 22)) ;; :size 20
  ;; (set-face-attribute 'default nil :font (font-spec :family "Iosevka Nerd Font" :size 20 :style "Regular")) ;; :size 20
  (set-fontset-font t 'unicode (font-spec :family "Noto Color Emoji" ));; :size 20 
  (set-fontset-font t 'han (font-spec :family "KaiTi"))
  )

(when *is-windows*
  (set-face-attribute 'default nil :font (font-spec :family "Consolas" :size 24))
  (set-fontset-font t 'han (font-spec :family "KaiTi"))
  )
;; (add-to-list 'face-font-rescale-alist '(cons (font-spec :family "KaiTi") 1.5) t)
;; (setf (alist-get "*KaiTi*" face-font-rescale-alist 1.5 nil 'string=) 1.5 )
;; (setq-local face-font-rescale-alist '("KaiTi" . 1.5))
;; (dolist (charset '(kana han cjk-misc))
;;    (set-fontset-font (frame-parameter nil 'font)
;;                      charset (font-spec :family "KaiTi"
;;                                         ;; :size 22 ; 16
;;                                         ;; :weight 'semi-bold
;;                                         )))
;; (add-to-list 'face-font-rescale-alist '("KaiTi" . 1.4))

;; all the icons font
(use-package all-the-icons
  :ensure t)

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  ;; (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom")
  ;; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Choose one theme to load
;; (load-theme 'doom-dark+ t)
(load-theme 'doom-dracula t)

;; Load dashboard
;; (require 'dashboard)
;; (dashboard-setup-startup-hook)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
  ;; Set the banner
  (setq dashboard-startup-banner 'logo)
  ;; Value can be
  ;; 'official which displays the official emacs logo
  ;; 'logo which displays an alternative emacs logo
  ;; 1, 2 or 3 which displays one of the text banners
  ;; "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer

  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)
  (setq dashboard-items '((recents . 7)
			 (bookmarks . 5)
			 (agenda . 3)))
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  ;; To disable shortcut "jump" indicators for each section, set
  ;; (setq dashboard-show-shortcuts nil)
  (setq dashboard-banner-logo-title "LeeSin@EndlessPeak"))

;; Load Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; Modeline Customization in modeline-customize.el
;; Required in init-core.el

;;(when (display-graphic-p)
;;  (set-frame-width (selected-frame) 1080)
;;  (set-frame-height (selected-frame) 1920))

;; Solve the full screen issue
(setq frame-resize-pixelwise t)

;;(setq default-frame-alist '((alpha-background . 75)))
;;(push '(alpha-background .50) default-frame-alist)
(provide 'init-ui)
