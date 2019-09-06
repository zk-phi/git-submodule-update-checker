#! /usr/bin/env emacs --script

(defconst git-root-dir
  (or (locate-dominating-file "." ".git")
      (error "Not under a git repo.")))

(unless (file-exists-p ".gitmodules")
  (error "No .gitmodules found."))

(with-temp-buffer
  (insert-file-contents (concat git-root-dir ".gitmodules"))
  (while (search-forward-regexp "^	path = \\(.*\\)$" nil t)
    (cd (concat git-root-dir (match-string 1)))
    (message "------------ %s" (match-string 1))
    (when (zerop (shell-command "git fetch origin master"))
      (message "%s" (shell-command-to-string "git log --oneline HEAD..origin/master")))))
