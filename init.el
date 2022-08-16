;; Version Check
(when (version< emacs-version "26.1")
  (error "This requires Emacs 26.1 and above!"))

;; Speed up startup process
(setq auto-mode-case-fold nil)

;; (setq visible-bell t)

;; Load path
(defun update-load-path (&rest _)
  "Update 'load-path' . "
  (dolist (dir '("site-lisp" "lisp" "lisp/lang"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

(update-load-path)

;; Indepentent custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-core)
