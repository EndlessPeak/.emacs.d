;; Font
;; Set Emacs Font for linux and windows operating system
(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

(defun leesin/font-setup ()
  "Font setup."

  (interactive)
  (when (display-graphic-p)
    ;; Default font
    (cl-loop for font in '("JetBrainsMono Nerd Font" "Source Code Pro" "Fira Code" "Hack"  "Menlo" "Monaco" "Consolas")
             when (font-installed-p font)
             return (set-face-attribute 'default nil
                                        :family font
                                        :weight 'normal
                                        :width 'normal
                                        :height (cond (*IS-MAC* 180)
                                                      (*IS-WINDOWS* 110)
                                                      (t 180))))

    ;; Unicode characters
    (cl-loop for font in '("Source Code Pro" "Segoe UI Symbol" "Symbola" "Symbol")
             when (font-installed-p font)
             return (set-fontset-font t 'unicode font nil 'prepend))

    ;; Emoji
    (cl-loop for font in '("Noto Color Emoji" "Apple Color Emoji")
             when (font-installed-p font)
             return (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend))

    ;; Chinese characters
    (cl-loop for font in '("霞鹜文楷" "KaiTi" "WenQuanYi Micro Hei" "Microsoft Yahei UI" "Microsoft Yahei" "STFangsong")
             when (font-installed-p font)
             return (progn
                      (setq face-font-rescale-alist `((,font . 1.2)))
                      (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family font)))))
  )

;; Get the font set
(leesin/font-setup) 
;;(add-hook 'emacs-startup-hook 'leesin/font-setup)

;;"霞鹜文楷" "WenQuanYi Micro Hei" "Microsoft Yahei UI" "Microsoft Yahei" "STFangsong"

;; (set-face-attribute 'default nil :font "JetbrainsMono Nerd Font" :height 120)
;;  (when *IS-LINUX*
;;    (set-face-attribute 'default nil :font (font-spec :family "SauceCodePro Nerd Font"
;;                                                                                       :weight 'normal
;;                                                                                       :slant 'normal
;;                                                                                       :size 20)) ;; :size 20
    ;; (set-face-attribute 'default nil :font (font-spec :family "Iosevka Nerd Font" :size 20 :style "Regular")) ;; :size 20
    ;;(set-fontset-font t 'unicode (font-spec :family "Noto Color Emoji" ) nil 'prepend :size 16);; :size 20
    ;;(set-fontset-font t 'han (font-spec :family "KaiTi") nil 'prepend)
;;    (dolist (charset '(kana han symbol cjk-misc bopomofo chinese-gbk))
;;      (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "KaiTi"
;;                                                        :weight 'normal
;;                                                        :slant 'normal )))

    ;;(set-fontset-font t 'han (font-spec :family "KaiTi"
    ;;                                                             :weight 'normal
    ;;                                                             :slant 'normal
    ;;                                                             :size 16))
;;  ))

;;(when *IS-WINDOWS*
;;  (set-face-attribute 'default nil :font (font-spec :family "Consolas" :size 24))
;;  (set-fontset-font t 'han (font-spec :family "KaiTi"))
;;  )
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

(when (display-graphic-p)
 (set-frame-width (selected-frame) 600)
 (set-frame-height (selected-frame) 800))

;; Solve the full screen issue
(setq frame-resize-pixelwise t)

;;(setq default-frame-alist '((alpha-background . 75)))
;;(push '(alpha-background .50) default-frame-alist)
(provide 'init-ui)
