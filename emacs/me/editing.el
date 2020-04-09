(require 'multiple-cursors)

(global-set-key (kbd "C-c m") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-unset-key (kbd "C-M-<down-mouse-1>"))
(global-set-key (kbd "C-M-<mouse-1>") 'mc/add-cursor-on-click)
(define-key mc/keymap (kbd "<return>") nil)

(delete-selection-mode)

(global-display-line-numbers-mode)

(setq backup-directory-alist `(("" . ,(concat (file-name-as-directory user-emacs-directory) "backups")))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(global-auto-revert-mode t)

(require 'yasnippet)
(yas-global-mode 1)
(global-set-key (kbd "C-c i") 'company-yasnippet)
