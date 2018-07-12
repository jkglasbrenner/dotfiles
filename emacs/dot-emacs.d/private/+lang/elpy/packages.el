;;; packages.el --- elpy layer packages file for Spacemacs.
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

;;; Commentary:

;; Add layer for elpy to Spacemacs

;;; Code:

(setq elpy-packages
      '(elpy
        org
        yapfify))

(defun python/pre-init-org ()
  (spacemacs|use-package-add-hook org
    :post-config (add-to-list 'org-babel-load-languages '(python . t))))

(defun python/init-yapfify ()
  (use-package yapfify
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'python-mode "=" 'yapfify-buffer)
      (when python-enable-yapf-format-on-save
        (add-hook 'python-mode-hook 'yapf-mode)))
    :config
    (progn
      (spacemacs|hide-lighter yapf-mode))))

(defun elpy/init-elpy ()
  (use-package elpy
    :defer t
    :mode ("\\.py\\'" . python-mode)
    :init
    (progn
      (elpy-enable))
    :config
    (progn
      (spacemacs//set-variables-for-elpy))))

;;; packages.el ends here
