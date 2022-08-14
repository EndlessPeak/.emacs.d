;; Default variables
(setq inhibit-splash-screen t)
(setq delete-by-mving-to-trash nil)
;; Disable Autosave
(setq auto-save-default nil)
;; Disable Backup
(setq make-backup-files nil)
(setq backup-inhibited t)

;; Default Mode
(setq-default major-mode 'text-mode)

;; Srcoll smoothly
(setq scroll-step 1
      scroll-conservatively 10000)

;; Function Defination
(defun leesin/toggle-proxy ()
  (interactive)
  (if (null url-proxy-services)
      (progn
        (setq url-proxy-services
              '(("http" . "127.0.0.1:20171")
                ("https" . "127.0.0.1:20171")))
        (message "代理已开启."))
    (setq url-proxy-services nil)
    (message "代理已关闭.")))

;;;###autoload
(defun leesin/toggle-transparency()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
              '(90 . 90) '(100 . 100)))))
(provide 'init-variable)
