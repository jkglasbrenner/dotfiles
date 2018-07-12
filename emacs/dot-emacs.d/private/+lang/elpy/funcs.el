;;; funcs.el --- elpy layer functions file for Spacemacs
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

(spacemacs|define-jump-handlers python-mode)

(defvar python-enable-yapf-format-on-save nil
  "If non-nil, automatically format code with YAPF on save.")

(defvar elpy-rpc-python-command "python"
  "The Python interpreter for the RPC backend.

This should be the same interpreter the project will be run with,
and not an interactive shell like ipython.")

(defvar elpy-test-runner 'elpy-test-pytest-runner
  "The test runner to use to run tests.")

(defun spacemacs//set-variables-for-elpy ()
  "Set variables for elpy."
  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter"))

;;; funcs.el ends here
