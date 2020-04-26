(require 'package)
(package-initialize)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(set-frame-font "Triplicate T4c 11" nil t)

(load-theme 'doom-solarized-light t)

(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)

(setq org-log-done 'time)
(setq clojure-align-forms-automatically t)
(setq projectile-project-search-path '("~/Dev/" "~/Dev/nu/"))

(setq css-indent-offset 2)

(setq
 backup-by-copying t			; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves/"))			; don't litter my fs tree
 auto-save-file-name-transforms
 `((".*" "~/.saves/" t))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(add-hook 'org-mode-hook #'olivetti-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'emacs-lisp-mode-hook #'lispy-mode)
(add-hook 'clojure-mode-hook #'lispy-mode)
(global-set-key (kbd "M-/") 'company-complete)

(projectile-mode 1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(which-key-mode 1)

(global-set-key (kbd "C-x g") 'magit-status)

(setq lispy-compat '(edebug cider god-mode magit-blame-mode))

(use-package flycheck-clj-kondo
  :ensure t)

(default-text-scale-mode)
(global-flycheck-mode)

(use-package clojure-mode
  :ensure t
  :config
  (define-clojure-indent
    (fact 1)
    (facts 1)
    (flow 1)
    (fnk 1)
    (provided 1)
    (providing 1)
    (verifying 1)
    (for-all 1)
    (let-entities 2))
  (require 'flycheck-clj-kondo))

;; (require 'evil)
;; (evil-mode 1)

(add-to-list 'load-path "~/.femacs.d/requires")
;; (load "packages.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (doom-themes default-text-scale flycheck-clj-kondo flycheck ledger-mode ripgrep which-key god-mode magit lispy evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(outline-1 ((t (:background "#FDF6E3" :foreground "#268bd2" :weight bold :height 1.25)))))
