;; Const variable
(require 'init-const)
(require 'init-package)
;; Self Defination
(require 'init-variable)

;; Edit Mode
(require 'init-evil)

;; Search engine
;; (require 'init-ivy)
(require 'init-vertico)

(require 'init-editor)
(require 'init-ui)
(require 'init-dashboard)
(require 'init-modeline)

;; Sidebar
(require 'init-sidebar)

;; Language support
(require 'init-complete)
(require 'init-lang)

;; Org Mode
(require 'init-org)


;; delay load
(defun load-custom-file()
  ;; Input Method
  (require 'init-input)
  ;; Key bindings
  (require 'init-kbd)
  ;; Self function
  (require 'init-function)
)

(add-hook 'after-init-hook #'load-custom-file)

(provide 'init-core)
