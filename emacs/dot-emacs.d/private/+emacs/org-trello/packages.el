;;; packages.el --- org-trello layer packages file for Spacemacs.
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

;;; Commentary:

;; Add layer for org-trello to Spacemacs

;;; Code:

(setq org-trello-packages
      '((org-trello :location (recipe
                               :fetcher github
                               :repo "org-trello/org-trello"))))

(defun org-trello/init-org-trello ()
  (use-package org-trello
    :defer t
    :init
    (progn
      (spacemacs//set-keybindings-for-org-trello))
    :config
    (progn
      (spacemacs//set-variables-for-org-trello))))

;;; packages.el ends here
