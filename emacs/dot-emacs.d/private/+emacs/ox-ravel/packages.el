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
  (spacemacs|use-package-add-hook org :post-config (require 'ox-ravel)))

(defun ox-ravel/post-init-ox-ravel ()
  (spacemacs//set-variables-for-ox-ravel))

;;; packages.el ends here
