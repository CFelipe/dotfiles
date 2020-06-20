(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/"))
(package-refresh-contents)

(setq my-packages
  '(clojure-mode
    cider
    clj-refactor
    flycheck
    flycheck-clj-kondo
    lispy

    js2-mode
    web-mode

    projectile
    ripgrep

    use-package

    default-text-scale

    magit
    forge

    company

    olivetti

    which-key

    ivy
    smex

    ledger-mode

    rjsx-mode

    doom-themes))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))
