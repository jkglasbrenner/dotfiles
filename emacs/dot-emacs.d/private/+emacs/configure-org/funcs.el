;;; funcs.el --- configure-org layer functions file for Spacemacs
;;
;; Author: James K. Glasbrenner <jglasbr2@gmu.edu>
;; URL: https://github.com/jkglasbrenner/dotfiles
;;
;; This file is not part of GNU Emacs.
;;
;;; License: Unlicense

(defun spacemacs//configure-org-latex-export ()
  "Customize outputs for org-latex-export."
  (setq
   org-latex-compiler "lualatex"
   org-latex-pdf-process '("latexmk -lualatex -bibtex-cond -outdir=%o -f %f")
   org-latex-hyperref-template
   (concat
    "\\hypersetup{" "\n"
    "  pdfauthor={%a}," "\n"
    "  pdftitle={%t}," "\n"
    "  pdfkeywords={%k}," "\n"
    "  pdfsubject={%d}," "\n"
    "  pdfcreator={%c}," "\n"
    "  pdflang={%L}," "\n"
    "  colorlinks={true}," "\n"
    "  linkcolor={Maroon}," "\n"
    "  citecolor={Blue}," "\n"
    "  urlcolor={Blue}," "\n"
    "  pdfhighlight=O," "\n"
    "  pdfborder={0 0 0}," "\n"
    "  bookmarksnumbered={true}," "\n"
    "  bookmarksopen={true}," "\n"
    "  breaklinks={true}," "\n"
    "  hyperfigures={true}," "\n"
    "  pdfstartview={FitH top}}")
   org-latex-default-packages-alist
   '(("utf8" "inputenc" t ("pdflatex"))
     ("T1" "fontenc" t ("pdflatex"))
     ("" "fontspec" t ("xelatex" "lualatex"))
     ("" "luaotfload" t ("lualatex"))
     ("math-style=TeX" "unicode-math" t ("xelatex" "lualatex"))
     ("" "textcomp" t ("pdflatex"))
     ("" "luacode" t ("lualatex"))
     ("" "ifxetex" t)
     ("" "ifluatex" t)
     ("" "amssymb" t)
     ("" "amsmath" t)
     ("normalem" "ulem" t)
     ("" "graphicx" t)
     ("" "grffile" t)
     ("" "wrapfig" nil)
     ("" "capt-of" nil)
     ("" "longtable" nil)
     ("" "rotating" nil)
     ("hyphens" "url" nil)
     ("" "microtype" nil)
     ("" "upquote" nil))
   org-latex-packages-alist
   '(("unicode=true" "hyperref" nil))
   spacemacs--org-latex-article-class
   `("article"
     ,(concat
       "\\documentclass[10pt]{article}" "\n"
       "\\usepackage[letterpaper, margin=0.79in]{geometry}" "\n"
       "[DEFAULT-PACKAGES]" "\n"
       "[PACKAGES]" "\n"
       "[EXTRA]" "\n"
       "\\UseMicrotypeSet[protrusion]{basicmath}" "\n"
       "\\urlstyle{same}" "\n"
       "\\ifnum 0\\ifxetex 1\\fi\\ifluatex 1\\fi=0" "\n"
       "  \\usepackage{libertine}" "\n"
       "  \\usepackage[libertine]{newtxmath}" "\n"
       "\\else" "\n"
       "  \\defaultfontfeatures{Ligatures=TeX}" "\n"
       "  \\setmainfont{Libertinus Serif}" "\n"
       "  \\setsansfont{Libertinus Sans}" "\n"
       "  \\setmonofont[Scale=MatchLowercase]{Libertinus Mono}" "\n"
       "  \\setmathfont[Scale=MatchUppercase]{Libertinus Math}" "\n"
       "\\fi")
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
   spacemacs--org-latex-memoir-class
   `("memoir"
     ,(concat
       "\\documentclass[10pt,letterpaper,oneside,onecolumn,openany,final]{memoir}" "\n"
       "[DEFAULT-PACKAGES]" "\n"
       "[PACKAGES]" "\n"
       "[EXTRA]" "\n"
       "\\usepackage{tikz}" "\n"
       "\\providecommand{\\HUGE}{\\Huge}" "\n"
       "\\newlength{\\drop}" "\n"
       "\\newcommand*{\\plogo}{\\fbox{$\\mathcal{PL}$}}")
     ("\\chapter{%s}" . "\\chapter*{%s}")
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
   )
  (spacemacs/set-leader-keys-for-major-mode
    'org-mode
    "TL" 'spacemacs/org-latex-compiler-cycle)
  (with-eval-after-load 'ox-latex
    (setcar org-latex-classes spacemacs--org-latex-article-class)
    (add-to-list 'org-latex-classes spacemacs--org-latex-memoir-class)
    )
  )

(defun spacemacs/org-latex-compiler-cycle ()
  "Cycles through the available latex compilers defined in org-latex-compilers."
  (interactive)
  (when org-latex-compiler
    (setq spacemacs--cycle-org-latex-compiler
          (or (cdr (memq org-latex-compiler org-latex-compilers))
              org-latex-compilers))
    (setq org-latex-compiler (pop spacemacs--cycle-org-latex-compiler))
    (message (concat "org-latex-compiler set to " org-latex-compiler))
    )
  (when org-latex-pdf-process
    (cond
     ((string-match "pdflatex" org-latex-compiler)
      (setq org-latex-pdf-process '("latexmk -pdf -dvi- -ps- -bibtex-cond -outdir=%o -f %f")))
     ((string-match "xelatex" org-latex-compiler)
      (setq org-latex-pdf-process '("latexmk -xelatex -bibtex-cond -outdir=%o -f %f")))
     ((string-match "lualatex" org-latex-compiler)
      (setq org-latex-pdf-process '("latexmk -lualatex -bibtex-cond -outdir=%o -f %f")))))
  )

;;; funcs.el ends here
