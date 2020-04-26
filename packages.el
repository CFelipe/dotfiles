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

    projectile
    ripgrep
    
    use-package

    default-text-scale
    
    magit
    
    company

    olivetti

    which-key

    ivy
    
    ledger-mode

    doom-themes))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

