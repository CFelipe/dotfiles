;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Felipe Cortez"
      user-mail-address "me@felipecortez.net")

(setq doom-font (font-spec :family "Triplicate T4c" :size 14))

(setq doom-theme 'doom-solarized-light)

(setq org-directory "~/org/")

(setq display-line-numbers-type 'relative)

(setq projectile-project-search-path '("~/Dev/"))

(setq evil-move-beyond-eol t)

(use-package! clojure-mode
  :config
  (define-clojure-indent
    (fact 1)
    (facts 1)
    (flow 1)
    (fnk 1)
    (provided 1)
    (providing 1)
    (verifying 1)
    (clojure.test.check/quick-check 2)
    (clojure.test.check.properties/for-all 2)
    (common-datomic.test-helpers/let-entities 2)))

(use-package! lispyville
  :hook ((common-lisp-mode . lispyville-mode)
         (emacs-lisp-mode . lispyville-mode)
         (scheme-mode . lispyville-mode)
         (racket-mode . lispyville-mode)
         (hy-mode . lispyville-mode)
         (lfe-mode . lispyville-mode)
         (clojure-mode . lispyville-mode))

  :bind (:map lispyville-mode-map
          ("M-L" . lispyville-beginning-of-next-defun))

  :config
  (lispyville-set-key-theme
   `(additional
     additional-insert
     (additional-movement normal visual motion)
     (additional-wrap normal insert)
     (atom-movement t)
     c-w
     c-u
     (commentary normal visual)
     (escape insert emacs)
     (operators normal)
     text-objects
     slurp/barf-cp)))

(add-hook! clojure-mode
  (require #'flycheck-clj-kondo)
  (setq clojure-align-forms-automatically t)
  (map!
   (:map clojure-mode-map
     (:localleader
       ("a" #'clojure-align)))))

(use-package! olivetti :hook (org-mode . olivetti-mode))

(defun orgify ()
  "Recursively index org files"
  (interactive)
  (setq-default
   org-directory "/home/felipecortez/org/"
   org-agenda-files (directory-files-recursively "/home/felipecortez/org/" "\\.org$")
   org-refile-targets '((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9))
   org-refile-use-outline-path t))

(map!
 (:after ivy
   :map ivy-minibuffer-map
   "M-j" #'ivy-yank-symbol)

 (:after clojure-mode
   (:map clojure-mode-map
     :nv "gD" #'cider-xref-fn-refs)))
