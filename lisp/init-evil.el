(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

;; Define Org Mode Keys
;(evil-declare-key 'normal org-mode-map
;  "gh" 'outline-up-heading
;  "$" 'org-end-of-line ; smarter behavior on headlines etc.
;  "^" 'org-beginning-of-line ; ditto
;  ;;"<" (lambda () (interactive) (org-demote-or-promote 1)) ; out-dent
;  ;;">" 'org-demote-or-promote ; indent
;  (kbd "TAB") 'org-cycle)

;; metaright and metaleft
;(evil-declare-key 'insert org-mode-map
  ;(kbd "TAB") 'org-do-demote 
  ;(kbd "<backtab>") 'org-do-promote)

(provide 'init-evil)
