;;; packages.el --- Conda Layer packages File for Spacemacs
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not a part of GNU Emacs.
;;
;;; License: Unlicense

(setq conda-packages
  '(
    (conda :location elpa)
    ))

(defun conda/init-conda ()
  (use-package conda
    :defer t
    :init
    (progn
      (setq conda-anaconda-home "/opt/miniconda/")
      )
    :config
    (progn
      (conda-env-initialize-interactive-shells)
      (conda-env-initialize-eshell)
      (conda-env-autoactivate-mode t)
      )
    )
  )
