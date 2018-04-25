
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq spacemacs-start-directory (file-name-as-directory (expand-file-name "spacemacs" user-emacs-directory)))
(load-file (expand-file-name "init.el" spacemacs-start-directory))
;(load-file (concat spacemacs-start-directory "init.el"))
