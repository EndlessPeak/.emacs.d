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
  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts nil)
  ;; To customize which widgets are dsiplayed and how many items are willing to show
  (setq dashboard-items '((recents . 5)
			              (bookmarks . 5)
			              (agenda . 3)))
  ;; To show info about packages loaded and the init time.
  (setq dashboard-set-init-info t)
  ;; Set all-the-icons for icons
  (setq dashboard-icon-type 'all-the-icons)
  ;; To add icons to the widget headings and their items
  (setq dashboard-set-file-icons t
        dashboard-set-heading-icons t)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")
                                    (agenda . "calendar")))
  (setq dashboard-set-navigator t)
  (setq dashboard-banner-logo-title "LeeSin@EndlessPeak"))

(provide 'init-dashboard)
