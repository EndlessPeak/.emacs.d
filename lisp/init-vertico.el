;; Enable vertico
(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode)
  ;; :bind
  ;; (:map vertico-map
  ;;           ("<tab>" . vertico-insert)    ; Choose selected candidate
  ;;           ("<escape>" . minibuffer-keyboard-quit) ; Close minibuffer
  ;;           ;; NOTE 2022-02-05: Cycle through candidate groups
  ;;           ("C-M-n" . vertico-next-group)
  ;;           ("C-M-p" . vertico-previous-group))
  :custom
  (vertico-count 15)  ; Number of candidates to display
  (vertico-resize nil)
  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  (vertico-cycle t)
  ;; Go from last to first candidate and first to last (cycle)?
  :config
  (vertico-mode)
  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)
  :custom-face
  ;; hightlight the current option
  (vertico-current ((t (:background "#4a3f5a"))))
  )

(use-package consult
  :ensure t
  :after(vertico)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure t
  :config
  (setq histroy-length 25)
  (savehist-mode 1))

;; add icons support for vertico
(use-package all-the-icons-completion
  :ensure t
  :hook (after-init . all-the-icons-completion-mode))

(provide 'init-vertico)
