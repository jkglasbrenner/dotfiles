;;; packages.el --- configure-org layer packages file for Spacemacs.
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

;;; Commentary:

;; Configurations for the default org layer in Spacemacs

;;; Code:

(setq configure-org-packages
      '(
        (org :location built-in)
        ))

(defun configure-org/post-init-org ()
    (spacemacs//configure-org-latex-export)
    )

;;; packages.el ends here
