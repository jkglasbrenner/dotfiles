;;; funcs.el --- org-trello layer functions file for Spacemacs
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

(when (configuration-layer/package-usedp 'org-trello)
  (defun spacemacs//set-keybindings-for-org-trello ()
    "Sets leader-key bindings for using org-trello"
    (spacemacs/declare-prefix-for-mode 'org-mode "mot" "trello")
    (spacemacs/set-leader-keys-for-minor-mode 'org-trello-mode "otv" 'org-trello-version))

  (defun spacemacs//set-variables-for-org-trello ()
    "Set variables for org-trello."
    ))

;;; funcs.el ends here
