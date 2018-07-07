;;; packages.el --- ox-ravel layer packages file for Spacemacs.
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

;;; Commentary:

;; Add layer providing support for the exporter ox-ravel to Spacemacs

;;; Code:

(setq ox-ravel-packages
      '((ox-ravel :location local)))

(defun ox-ravel/init-ox-ravel ()
  (use-package ox-ravel
    :defer t
    :config
    (progn
      (spacemacs//set-variables-for-ox-ravel))))

;;; packages.el ends here
