;;; config.el --- direnv layer configuration file for Spacemacs
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

;; Variables

(defvar direnv-always-show-summary t
  "Whether to show a summary message of environment changes on every change.

When nil, a summary is only shown when direnv-update-environment
is called interactively.")

(defvar direnv-show-paths-in-summary t
  "Whether to show directory paths in the summary message.")

(defvar direnv-use-faces-in-summary t
  "Whether to use custom font faces in the summary message.

When enabled, the summary message uses custom font faces strings
for added, changed, and removed environment variables, which
usually results in coloured output.")

(defvar direnv-non-file-modes nil
  "List of modes where direnv will update even if the buffer has no file.

In these modes, direnv will use ‘default-directory’ instead of
‘(file-name-directory (buffer-file-name (current-buffer)))’.")

;; Command Prefixes

;;; config.el ends here
