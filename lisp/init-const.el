;; init-const.el --- Define constants.

;; Judge Operation System
(defconst sys/win32p
   (eq system-type 'windows-nt)
   "We are running on a WinNT system.")

(defconst sys/linux
   (eq system-type 'gnu/linux)
   "We are running on a GNU/Linux system.")

(defconst emacs/>=28p
  (>= emacs-major-version 28)
  "Emacs is 28 or above.")

(provide 'init-const)
