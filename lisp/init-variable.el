;; Judge Operation System
(defconst *IS-MAC* (eq system-type 'darwin))
(defconst *IS-LINUX* (eq system-type 'gnu/linux))
(defconst *IS-WINDOWS* (memq system-type '(cygwin windows-nt ms-dos)))
;; Coding System UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; Default variables
(setq inhibit-splash-screen t)
(setq delete-by-mving-to-trash nil)
;; Disable Autosave
(setq auto-save-default nil)
;; Disable Backup
(setq make-backup-files nil)
(setq backup-inhibited t)

;; use short answers for YES/NO ect.
(setq use-short-answers t)
(setq-default tab-width 4
	      indent-tabs-mode nil)

;; Default Mode
(setq-default major-mode 'text-mode)

;; Srcoll smoothly
(setq scroll-step 1
      scroll-conservatively 10000)

(when *IS-WINDOWS*
  (setq default-directory "E:/"))
;; Appearence
(dolist (hook (list
              'org-mode-hook
              'emacs-lisp-mode-hook
              'conf-mode-hook
              'c-mode-hook
              'c++-mode-hook
              'java-mode-hook
              'python-mode-hook))
(add-hook hook #'(lambda ()
               ;; 设置自动换行
               (setq truncate-lines nil)
               ;; 针对中文折行的问题进行设置
               ;;(setq word-wrap nil)
               (auto-fill-mode -1)
               )))
;;(setq word-wrap-by-category t)
(provide 'init-variable)
