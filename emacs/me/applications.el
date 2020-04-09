(require 'comint)

(defun comint-clear-buffer ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(eval-after-load "comint"
  '(define-key comint-mode-map "\C-c\C-l" #'comint-clear-buffer))

(setq browse-url-browser-function 'browse-url-default-browser)

(defun eshell-new()
  "Open a new instance of eshell."
  (interactive)
  (eshell 'N))
