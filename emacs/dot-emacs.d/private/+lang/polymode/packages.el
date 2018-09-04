;;; packages.el --- polymode layer packages file for Spacemacs.
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

;;; Commentary:

;; Add layer for polymode to Spacemacs

;;; Code:

(setq polymode-packages
      '(poly-markdown
        poly-R))

(defun polymode/init-poly-markdown ()
  (use-package poly-markdown
    :mode (("\\.Rmd$" . poly-markdown-mode)
           ("\\.md$" . poly-markdown-mode))
    :defer t))

(defun polymode/init-poly-R ()
  (use-package poly-R
    :defer t))

;;; packages.el ends here
