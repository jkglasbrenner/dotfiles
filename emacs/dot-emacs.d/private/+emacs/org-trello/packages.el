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
      (spacemacs/declare-prefix-for-mode 'org-mode "mot" "trello")
      (spacemacs/declare-prefix-for-mode 'org-mode "motb" "board")
      (spacemacs/declare-prefix-for-mode 'org-mode "motc" "card")
      (spacemacs/declare-prefix-for-mode 'org-mode "motm" "metadata")
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otV" 'org-trello-version)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otmk" 'org-trello-install-key-and-token)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otmI" 'org-trello-install-board-metadata)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otcs" 'org-trello-sync-card)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otbs" 'org-trello-sync-buffer)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "ota" 'org-trello-assign-me)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otmv" 'org-trello-check-setup)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otmD" 'org-trello-delete-setup)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otmC" 'org-trello-create-board-and-install-metadata)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otk" 'org-trello-kill-entity)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otcK" 'org-trello-kill-cards)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otca" 'org-trello-archive-card)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otcA" 'org-trello-archive-cards)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otcj" 'org-trello-jump-to-trello-card)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otbj" 'org-trello-jump-to-trello-board)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otcP" 'org-trello-add-card-comments)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otcc" 'org-trello-show-card-comments)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otcl" 'org-trello-show-card-labels)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otmu" 'org-trello-update-board-metadata)
      (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "oth" 'org-trello-help-describing-bindings)
      )
    :config
    (progn
      (spacemacs//set-variables-for-org-trello))))

;;; packages.el ends here
