;;; emacs --- My emacs config

;;; Commentary:

;;; Code:

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'package)

(setq package-enable-at-startup nil)
(setq package-archives '(("melpa"     . "https://melpa.org/packages/")
                         ("gnu"       . "https://elpa.gnu.org/packages/")
                         ("org"       . "http://orgmode.org/elpa/")))
;; (setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                                        ;                          ("gnu"       . "http://elpa.gnu.org/packages/")
                                        ;                          ("melpa"     . "https://melpa.org/packages/")
                                        ;                          ("marmalade" . "http://marmalade-repo.org/packages/")))
(unless package--initialized (package-initialize t))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(set-frame-font "Source Code Pro 10")
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro 11"))

;; Auto refresh
(global-auto-revert-mode 1)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)
(add-to-list 'global-auto-revert-ignore-modes 'Buffer-menu-mode)

(setq org-replace-disputed-keys t)

(use-package diminish :ensure t)

(use-package server
  :config
  (unless (server-running-p) (server-start)))

(prefer-coding-system 'utf-8)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

                                        ; Disable ui stuff
                                        ; disable scrollbar
(scroll-bar-mode -1)
                                        ; disable toolbar
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq make-backup-files nil)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(delete-selection-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

 ;(show-paren-mode 1)
(global-set-key (kbd "C-c N") 'make-frame)
(global-set-key (kbd "C-x w") 'delete-frame)

(use-package smartparens
  :ensure t
  :diminish (smartparens-mode . " ⓟ")
  :config
  (smartparens-global-mode)
  (require 'smartparens-ruby))

(use-package highlight-parentheses
  :ensure t
  :diminish ""
  :config
  (global-highlight-parentheses-mode)
  (set-face-attribute 'hl-paren-face nil :weight 'ultra-bold))

(use-package volatile-highlights
  :ensure t
  :diminish ""
  :config
  (volatile-highlights-mode t))

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init
  (load-theme 'spacemacs-dark t)
  (setq spacemacs-theme-comment-bg nil))

(use-package whitespace
  :diminish ""
  :commands whitespace-mode
  :init
  (add-hook 'prog-mode-hook 'whitespace-mode)
  :config
  (setq whitespace-line-column 120
        whitespace-style '(face trailing tabs empty lines-tail tab-mark)))

(global-hl-line-mode t)
(global-linum-mode t)

(use-package which-key
  :ensure t
  :diminish (which-key-mode . " Ⓚ")
  :config
  (which-key-mode)
  (which-key-setup-minibuffer)
  (setq which-key-sort-order 'which-key-prefix-then-key-order
        which-key-idle-delay 0.4))

(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :init
  (ivy-mode 1)
  (setq ivy-height 15
        ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) ")
  :bind*
  (("C-c C-r" . ivy-resume))
  :config
  (setq ivy-re-builders-alist
        '((ivy-switch-buffer . ivy--regex-plus)
          (swiper . ivy--regex-plus)
          (counsel-M-x . ivy--regex-plus))))
                                        ;          (t . ivy--regex-fuzzy))))

(use-package counsel
  :ensure t
  :bind*
  (("C-c k" . counsel-projectile-ag)
   ("C-x C-f" . counsel-find-file)
   ("M-x" . counsel-M-x)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable))
  :config
  (setq ivy-initial-inputs-alist nil))
  ;; (setq counsel-projectile-ag-extra-actions (("p" counsel-projectile-ag-action-switch-project "switch project")  ("j" counsel-projectile-action-other-window "other window"))))

(use-package swiper
  :ensure t
  :bind*
  (("C-s" . swiper)
   ("C-r" . swiper)
   ("C-M-s" . swiper-all)))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

(use-package projectile
  :ensure t
  :diminish ""
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map))
  :config
  (progn
    (add-hook 'prog-mode-hook 'projectile-mode)
    (setq projectile-completion-system 'ivy)
    (setq magit-completing-read-function 'ivy-completing-read)))

(use-package slim-mode
  :ensure t
  :mode "\\.slim\\'")

(use-package scss-mode
  :ensure t
  :mode "\\.scss\\'"
  :config
  (setq css-indent-offset 2))

(use-package clojure-mode
  :ensure t
  :mode "\\.clj\\'")

(use-package cider
  :ensure t)

(use-package go-mode
  :ensure t
  :mode "\\.go\\'")

(use-package markdown-mode
  :ensure t
  :mode (("\\.markdown\\'" . gfm-mode) ("\\.md\\'" . gfm-mode)))

(use-package markdown-preview-mode
  :ensure t)

(use-package company
  :ensure t
  :diminish (company-mode . " ⓐ")
  :config
  (progn
    (global-company-mode)
    (setq company-backends
          '(company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                         (company-dabbrev-code company-gtags company-keywords)
                         company-oddmuse company-dabbrev))))

(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status))
  :config
  (progn
    (require 'git-commit)
    (global-git-commit-mode t)
    ))

(use-package ghub
  :ensure t)

(use-package magithub
  :ensure t
  :after magit
  :config
  (progn
    (setq magithub-github-hosts (list "github.com" "github.dev.pages"))
    ;; (setq ghub-default-host my-ghub-base-url)
    (magithub-feature-autoinject t)
    (require 'magithub-issue-view)))

;; (use-package ace-window
;;   :ensure t
;;   :bind*
;;   ("M-p". ace-window)
;;   :config
;;   (setq aw-dispatch-always t))

(use-package winum
  :ensure t
  :config
  (setq winum-auto-setup-mode-line nil)
  (winum-mode)
  (winum-set-keymap-prefix (kbd "<f10>")))

(use-package zoom-window
  :ensure t
  :bind*
  ("C-x C-z" . zoom-window-zoom)
  :config
  (setq zoom-window-mode-line-color nil))

(use-package windmove
  :ensure t
  :config
  (progn
    (windmove-default-keybindings)
    (setq windmove-wrap-around t)))

;; (use-package framemove
;;   :ensure t
;;   :config
;;   (framemove-default-keybindings))

(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings))

(use-package crux
  :ensure t
  :bind*
  (("M-RET" . crux-smart-open-line)
   ("s-<return>" . crux-smart-open-line-above)
   ("C-M-k" . crux-kill-whole-line)
   ("C-c I" . crux-find-user-init-file)
   ("C-c n" . crux-cleanup-buffer-or-region)))

(use-package buffer-flip
  :ensure t
  :bind  (("M-<tab>" . buffer-flip)
          :map buffer-flip-map
          ( "M-<tab>" .   buffer-flip-forward)
          ( "M-S-<tab>" . buffer-flip-backward)
          ( "M-ESC" .     buffer-flip-abort))
  :config
  (setq buffer-flip-skip-patterns
        '("^\\*helm\\b"
          "^\\*swiper\\*$")))

(use-package dired
  :config
  (require 'dired-x))

(use-package imenu-anywhere
  :ensure t
  :bind (("C-c i" . ivy-imenu-anywhere)))

(use-package discover-my-major
  :ensure t
  :bind*
  (("C-h C-m" . discover-my-major)
   ("C-h M-m" . discover-my-mode)))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package spaceline
  :ensure t
  :config
  (progn
    (require 'spaceline-config)
    (setq powerline-default-separator 'utf-8
          spaceline-window-numbers-unicode t)
    (spaceline-define-segment zoom-mode
      "Show if in Zoom mode."
      (when (fboundp 'zoom-window--enable-p)
        (when (zoom-window--enable-p)
          (propertize "Zoom" 'face '(:foreground "green" :weight bold)))))
    (spaceline-compile)
    (spaceline-emacs-theme 'zoom-mode)))

(use-package ruby-tools
  :ensure t
  :config
  (setq ruby-insert-encoding-magic-comment nil))

(use-package inf-ruby
  :ensure t)

(use-package rbenv
  :ensure t
  ;; :init (setq rbenv-show-active-ruby-in-modeline nil)
  ;; :init (setq rbenv-installation-dir "/usr/local")
  :init
  (progn
    (setq rbenv-modeline-function 'rbenv--modeline-plain))
  :config
  (progn
    (global-rbenv-mode)
    (add-hook 'ruby-mode-hook 'rbenv-use-corresponding)))

(use-package robe
  :ensure t
  :config
  (progn
    (add-hook 'ruby-mode-hook 'robe-mode)))

(use-package flycheck
  :ensure t
  :diminish ""
  :config
  (global-flycheck-mode))

(use-package yasnippet
  :ensure t
  :diminish yas-global-mode yas-minor-mode
  :config
  (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t)

(use-package coffee-mode
  :ensure t)

(use-package yaml-mode
  :ensure t
  :mode "\\.yml\\'")

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  (setq js2-basic-offset 2))

(use-package tern
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'tern-mode))

(use-package company-tern
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern))

(use-package rjsx-mode
  :ensure t
  :mode "components\\/.*\\.js\\'")

(use-package polymode
  :ensure t
  :after rjsx-mode
  :config
  (define-hostmode poly-rjsx-hostmode nil
    "RJSX hostmode."
    :mode 'rjsx-mode)
  (define-innermode poly-rjsx-css-innermode nil
    :mode 'css-mode
    :head-matcher "css\`"
    :tail-matcher "\`"
    :head-mode 'host
    :tail-mode 'host)
  (define-polymode poly-rjsx-mode
    :hostmode 'poly-rjsx-hostmode
    :innermodes '(poly-rjsx-css-innermode))
  (add-to-list 'auto-mode-alist '("components\\.jsx?\\'" . poly-rjsx-mode)))

(use-package tide
  :ensure t
  :diminish t
  :init
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (flycheck-add-next-checker 'typescript-tide '(t . typescript-tslint) 'append)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1)
    ;; aligns annotation to the right hand side
    (setq company-tooltip-align-annotations t)))
(flycheck-add-mode 'typescript-tslint 'web-mode)

(use-package typescript-mode
  :ensure t
  :mode "\\.tsx?\\'"
  :init
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t
        typescript-indent-level 2)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  :config
  (setq js-indent-level 2))

(use-package web-mode
  :ensure t
  :mode "\\.html\\'"
  :config
  (setq web-mode-enable-css-colorization t
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-markup-indent-offset 2))

(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region))

;; (use-package wrap-region
;;   :ensure t
;;   :config
;;   (wrap-region-add-wrappers
;;    '(("\ " "\ " nil ruby-mode)
;;      ("*" "*" nil org-mode)
;;      ("~" "~" nil org-mode)
;;      ("/" "/" nil org-mode)
;;      ("=" "=" "+" org-mode)
;;      ("_" "_" nil org-mode)
;;      ("$" "$" nil (org-mode latex-mode))))
;;   (add-hook 'org-mode-hook 'wrap-region-mode)
;;   (add-hook 'latex-mode-hook 'wrap-region-mode))

(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

(use-package zop-to-char
  :ensure t
  :bind*
  (("M-z" . zop-up-to-char)
   ("M-Z" . zop-to-char)))

(use-package beacon
  :ensure t
  :diminish ""
  :config
  (beacon-mode 1))

(use-package undo-tree
  :ensure t
  :diminish ""
  :config
  (global-undo-tree-mode))

(use-package browse-kill-ring
  :ensure t
  :config
  (browse-kill-ring-default-keybindings))

(use-package easy-kill
  :ensure t
  :bind*
  (("M-w" . easy-kill)
   ("M-W" . easy-mark)))

(use-package ggtags
  :ensure t
  :bind*
  (("M-." . ggtags-find-tag-dwim))
  :config
  (setq gtags-path-style 'relative))

(use-package org
  ;; :ensure org-plus-contrib
  :pin "org"
  :bind*
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c b" . org-iswitchb))
  :config
  (progn
    (setq org-archive-location (concat "~/.org/archive/" (format-time-string "%Y") ".org::* " (format-time-string "%B")))
    (setq org-pretty-entities t)
    (setq org-log-done t)
    (setq org-agenda-files (file-expand-wildcards "~/.org/wp/*.org"))
    (setq org-directory "~/.org/wp")
    (setq org-default-notes-file (concat org-directory "/notes.org"))
    (setq org-capture-templates
          '(("p" "Pro Task" entry (file+headline "~/.org/wp/pro_projects.org" "Daily tasks")
             "** TODO %?\n  %i\n  %a\n\n"))
          )))

(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook 'org-bullets-mode))

(setq org-ellipsis "…")

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(use-package groovy-mode
  :ensure t
  :mode "\\.groovy\\'"
  :config
  (setq groovy-indent-offset 2))

(use-package auctex
  :defer t
  :ensure t
  :init
  (progn
    (setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil)))

(use-package prettier-js
  :ensure t
  :bind
  ("C-c C-p" . prettier-js))

(use-package feature-mode
  :ensure t
  :mode "\\.feature\\'")

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (markdown-preview-mode magithub org-plus-contrib org-bullets browse-kill-ring exec-path-from-shell zoom-window winum markdown-mode window-numbering spaceline-all-the-icons volatile-highlights zop-to-char expand-region web-mode yasnippet-snippets yaml-mode which-key use-package spacemacs-theme spaceline smartparens slim-mode scss-mode ruby-tools move-text magit json-mode js2-mode highlight-parentheses flycheck discover-my-major diff-hl crux counsel-projectile company coffee-mode clojure-mode ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
