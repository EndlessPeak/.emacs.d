(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

;; Define Org Mode Keys
(evil-declare-key 'normal org-mode-map
  "gh" 'outline-up-heading
  "$" 'org-end-of-line ; smarter behavior on headlines etc.
  "^" 'org-beginning-of-line ; ditto
  ;;"<" (lambda () (interactive) (org-demote-or-promote 1)) ; out-dent
  ;;">" 'org-demote-or-promote ; indent
  (kbd "TAB") 'org-cycle)

(evil-declare-key 'insert org-mode-map
  (kbd "TAB") 'org-metaright
  (kbd "<backtab>") 'org-metaleft)

(provide 'init-evil)
