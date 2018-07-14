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
      '((polymode (recipe :fetcher github
                          :repo "vspinu/polymode"
                          :branch "next"))))

(defun polymode/init-polymode ()
  (use-package polymode
    :defer t
    :mode (("\\.Snw$" . poly-noweb+r-mode)
           ("\\.Rnw$" . poly-noweb+r-mode)
           ("\\.Rmd$" . poly-markdown+r-mode)
           ("\\.rapport$" . poly-rapport-mode)
           ("\\.Rhtml$" . poly-html+r-mode)
           ("\\.Rbrew$" . poly-brew+r-mode)
           ("\\.Rcpp$" . poly-r+c++-mode)
           ("\\.cppR$" . poly-c++r-mode)
           ("\\.py\\'" . python-mode))
    :config
    (progn
      (spacemacs//set-variables-for-polymode))))

;;; packages.el ends here
