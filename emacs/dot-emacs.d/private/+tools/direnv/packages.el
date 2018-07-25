;;; packages.el --- direnv layer packages file for Spacemacs.
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

;;; Commentary:

;; Add layer for direnv to Spacemacs

;;; Code:

(setq direnv-packages
      '(direnv))

(defun direnv/init-direnv ()
  (use-package direnv
    :defer t
    :init
    (spacemacs|add-toggle direnv-active
      :evil-leader "te"
      :documentation "Enable direnv minor mode."
      :status direnv-mode
      :on (direnv-mode 1)
      :off (direnv-mode -1))))

;;; packages.el ends here
