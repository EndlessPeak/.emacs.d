;; Version Check
(when (version< emacs-version "26.1")
  (error "This requires Emacs 26.1 and above!"))

;; Prevent flashing of unstyled modeline at startup
(setq-default mode-line-format nil)

;; Speed up startup process,don't pass case-insensitive to `auto-mode-alist'
(setq auto-mode-case-fold nil)

;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
(defun update-load-path (&rest _)
  "Update 'load-path' . "
  (dolist (dir '("site-lisp" "lisp" "lisp/lang"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

(advice-add #'package-initialize :after #'update-load-path)

(update-load-path)

;; Indepentent custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-core)
