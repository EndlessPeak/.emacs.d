;; Function Defination
(defun leesin/toggle-proxy ()
  (interactive)
  (if (null url-proxy-services)
      (when *is-windows*
        (progn
            (setq url-proxy-services
                '(("http" . "127.0.0.1:10808")
                    ("https" . "127.0.0.1:10808")))
            (message "代理已开启.")))
      (when *is-linux*
        (progn
            (setq url-proxy-services
                '(("http" . "127.0.0.1:20171")
                    ("https" . "127.0.0.1:20171")))
            (message "代理已开启.")))
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
              '(70 . 70) '(100 . 100)))))

(defun animate-text (text)
  ;; https://github.com/matrixj/405647498.github.com/blob/gh-pages/src/emacs/emacs-fun.org
  (interactive "stext: ")  ; s means read-string
  (switch-to-buffer (get-buffer-create "*butterfly*"))
  (erase-buffer)
  (animate-string text 10))

(provide 'init-function)
