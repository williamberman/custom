(package-initialize)

;; On first startup, eval the bottom of this buffer, `package-refresh-contents', `package-install-selected-packages', and then restart emacs

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(defun os-path-join (a &rest ps)
  (let ((path a))
    (while ps
      (let ((p (pop ps)))
        (cond ((string-prefix-p "/" p)
               (setq path p))
              ((or (not path) (string-suffix-p "/" p))
               (setq path (concat path p)))
              (t (setq path (concat path "/" p))))))
    path))

(defun my-files-to-load (dir)
  (seq-filter
   (lambda (name) (not (string-match-p (regexp-quote ".dir-locals") name)))
   (file-expand-wildcards
    (os-path-join
     (substring user-emacs-directory 0 -1)
     dir
     "*.el"))))

(mapc 'load (my-files-to-load "vendor"))
(mapc 'load (my-files-to-load "me"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (racket-mode slime flycheck magit yasnippet-snippets yasnippet company exec-path-from-shell haskell-mode ace-window counsel multiple-cursors rainbow-delimiters smartparens))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
