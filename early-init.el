;; Enhance IO
(setq read-process-output-max ( * 1024 1024))

(setq process-adaptive-read-buffering nil)

;; Defer garbage collection further back in the startup process
;; (setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-threshold 134217728   ; 128mb
      gc-cons-percentage 1.0)

;; Prevent unwanted runtime compilation for gccemacs (native-comp) users;
;; packages are compiled ahead-of-time when they are installed and site files
;; are compiled when gccemacs is installed.
(setq native-comp-deferred-compilation nil)

;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
(setq load-prefer-newer noninteractive)

;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)

;; Faster to disable these here (before they've been initialized)
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(set-fringe-mode 10)

