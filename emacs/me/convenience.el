(require 'counsel)

(counsel-mode)
(global-set-key [remap isearch-forward] 'swiper)
(global-set-key [remap switch-to-buffer] 'counsel-ibuffer)

(global-set-key (kbd "M-o") 'ace-window)

(defun search-bindings ()
  "Search in the keys bindings buffer"
  (interactive)
  (describe-bindings)
  (other-window 1)
  (isearch-forward))

(global-set-key (kbd "C-c h b") 'search-bindings)
(global-set-key (kbd "C-c v") 'view-mode)

(setq confirm-kill-emacs 'yes-or-no-p)

(defun really-kill-emacs ()
  "Like `kill-emacs', but ignores `kill-emacs-hook'."
  (interactive)
  (let (kill-emacs-hook)
    (kill-emacs)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
