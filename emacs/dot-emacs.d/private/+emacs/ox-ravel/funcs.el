;;; funcs.el --- ox-ravel layer functions file for Spacemacs
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

(when (configuration-layer/package-usedp 'ox-ravel)
  (defun spacemacs//set-variables-for-ox-ravel ()
    "Set variables for ox-ravel."
    (setq
     org-ravel-engines
     '((("R")
        ("c" . "engine='c'")
        ("c++" . "engine='Rcpp'")
        ("C" . "engine='c'")
        ("C++" . "engine='Rcpp'")
        ("python" . "engine='python'")
        ("tikz" . "engine='tikz'"))))))

;;; funcs.el ends here
