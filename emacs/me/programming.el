(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(require 'company)
(require 'python)
(require 'racket-mode)

(setq python-shell-interpreter "python3")

(setq haskell-stylish-on-save t)
(setq haskell-tags-on-save t)

(add-hook 'prog-mode-hook 'imenu-add-menubar-index)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(eval-after-load "haskell-mode"
  '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
  '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))

(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-<tab>") 'company-complete)


;; TODO should likely be a directory only variable
(setq haskell-compile-cabal-build-command "stack build")
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-process-suggest-remove-import-lines t
      haskell-process-auto-import-loaded-modules t
      haskell-process-log t)
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)

(global-set-key (kbd "C-x g") 'magit-status)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(add-hook 'racket-mode-hook #'racket-xp-mode)

(when (string-equal system-type "darwin")
  (setq flycheck-python-pylint-executable "~/Library/Python/3.7/bin/pylint"))

