(defun my-do-something-to-all ()
  (dolist (file (directory-files-recursively "src" ".hs"))
    (find-file file) (not-modified 1) (save-buffer)))
