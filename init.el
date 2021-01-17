(require 'package)
(package-initialize)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(when (find-font (font-spec :name "Triplicate T4C 16"))
  (set-frame-font "Triplicate T4c 16" nil t))

(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package org
  :init
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/")
        org-refile-targets '((org-agenda-files :maxlevel . 3))
        org-refile-use-outline-path 'file
        org-outline-path-complete-in-steps nil
        org-refile-allow-creating-parent-nodes 'confirm
        org-tags-column 0
        org-log-done 'time
        org-hide-leading-stars 't))

(use-package doom-themes
	     :ensure t
	     :config (load-theme 'doom-solarized-light t))

(use-package csv-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package counsel
  :ensure t
  :after ivy
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-r" . counsel-recentf))
  :config (counsel-mode)
  (setq-default ivy-use-virtual-buffers t
                enable-recursive-minibuffers t
                ivy-initial-inputs-alist nil))

(use-package ivy
  :ensure t
  ;; :defer 0.1
  :diminish
  :bind (("C-x b" . ivy-switch-buffer))
  :config (ivy-mode))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-c C-r" . ivy-resume)))

(use-package projectile
  :ensure t
  :bind-keymap (("C-c p" . projectile-command-map))
  :init
  (setq projectile-completion-system 'ivy
        projectile-project-search-path '("~/dev/")))

(projectile-mode 1)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package forge
  :after magit)

(use-package flycheck-clj-kondo
  :ensure t)

(use-package default-text-scale
  :ensure t
  :config (default-text-scale-mode))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package clojure-mode
  :ensure t
  :init (setq clojure-align-forms-automatically t)
  :config
  (define-clojure-indent
    (against-background 'defun)
    (alet 'defun)
    (as-> 1)
    (as-customer 1)
    (as-of 1)
    (constraint-fn 'defun)
    (data-fn 'defun)
    (defflow 'defun)
    (defflow-loopback-false 'defun)
    (fact 'defun)
    (facts 'defun)
    (flow 'defun)
    (flow-mx 'defun)
    (fnk 1)
    (for-all 'defun)
    (for-all 1)
    (future-fact 'defun)
    (let-entities 'defun)
    (log-messages 'defun)
    (mlet 'defun)
    (provided 'defun)
    (providing 'defun)
    (request-context 'defun)
    (tabular 'defun)
    (tabular-flow 'defun)
    (verify 'defun)
    (verifying 1))
  (require 'flycheck-clj-kondo))

(use-package smartparens
  :ensure t
  :bind
  ("C-M-S-t" . (lambda ()
                       (interactive)
                       (sp-transpose-sexp -1)))
  ("S-]" . nil)
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode 1)
  (sp-pair "[" "]" :insert "}")
  (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
  (add-hook 'clojure-mode-hook 'smartparens-mode)
  (add-hook 'clojurescript-mode-hook 'smartparens-mode)
  (add-hook 'cider-repl-mode-hook 'smartparens-mode))

(use-package cider
  :ensure t
  :init (setq cider-repl-pop-to-buffer-on-connect nil))

(add-hook 'cider-mode-hook (lambda ()
                             (add-to-list 'cider-test-defining-forms "defflow")))

(use-package company
  :ensure t
  :bind (("M-/" . company-complete)))

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)



(use-package olivetti
  :ensure t)

(use-package ace-window
  :ensure t)

(use-package smex
  :ensure t)

(setq-default js-indent-level 2)
(setq-default web-mode-markup-indent-offset 2)
(setq-default web-mode-css-indent-offset 2)
(setq-default web-mode-code-indent-offset 2)

(setq-default css-indent-offset 2)
(setq-default whitespace-style '(face spaces tabs trailing tab-mark))

(setq-default indent-tabs-mode nil)
(setq-default require-final-newline t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(add-hook 'org-mode-hook #'olivetti-mode)
;; (add-hook 'org-mode-hook #'org-variable-pitch-minor-mode)
(add-hook 'markdown-mode-hook #'olivetti-mode)

(global-set-key (kbd "C-x o") 'ace-window)

(setq-default
 backup-by-copying t                    ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves/"))                 ; don't litter my fs tree

 auto-save-file-name-transforms
 `((".*" "~/.saves/" t))

 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(load "~/.emacs.d/felisp.el")

(add-to-list 'load-path "~/.femacs.d/requires")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" default))
 '(org-roam-directory "~/org/interlinked/")
 '(package-selected-packages
   '(yaml-mode csv-mode ace-window smartparens org-roam rjsx-mode smex web-mode js2-mode forge doom-themes default-text-scale flycheck-clj-kondo flycheck ledger-mode ripgrep which-key god-mode magit lispy evil))
 '(safe-local-variable-values
   '((cider-figwheel-main-default-options . "dev")
     (cider-default-cljs-repl . figwheel-main))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(info-menu-header ((t (:inherit default :weight normal :family "Triplicate C4c"))))
 '(line-number-current-line ((t (:weight normal :inherit (hl-line default) :background "#e5e1d2" :foreground "#556b72" :strike-through nil :underline nil :slant normal))))
 '(outline-1 ((t (:background "#FDF6E3" :foreground "#268bd2" :weight normal :height 1.25))))
 '(outline-2 ((t (:foreground "#d33682" :weight normal))))
 '(outline-3 ((t (:foreground "#6c71c4" :weight normal))))
 '(outline-4 ((t (:foreground "#5ca8dd" :weight normal))))
 '(variable-pitch ((t (:family "Charter")))))
