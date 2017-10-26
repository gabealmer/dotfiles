;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

(require 'package)

(setq package-enable-at-startup nil)
(setq package-archives '(("melpa"     . "https://melpa.org/packages/")))
;; (setq package-archives '(("org"       . "http://orgmode.org/elpa/")
;                          ("gnu"       . "http://elpa.gnu.org/packages/")
;                          ("melpa"     . "https://melpa.org/packages/")
;                          ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(set-frame-font "Source Code Pro 10")

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

;(show-paren-mode 1)

(use-package smartparens
  :ensure t
  :diminish (smartparens-mode . " ⓟ")
  :config
  (smartparens-global-mode))

(use-package highlight-parentheses
  :ensure t
  :diminish ""
  :config
  (global-highlight-parentheses-mode)
  (set-face-attribute 'hl-paren-face nil :weight 'ultra-bold))

;(use-package volatile-highlights
;  :ensure t
;  :config
;  (volatile-highlights-mode t))

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init
  (load-theme 'spacemacs-dark t))

(use-package whitespace
  :diminish ""
  :commands whitespace-mode
  :init
  (add-hook 'prog-mode-hook 'whitespace-mode)
  :config
  (setq whitespace-line-column 120
        whitespace-style '(face trailing tabs empty tab-mark)))

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
  :config
  (setq ivy-re-builders-alist
        '((ivy-switch-buffer . ivy--regex-plus)
          (swiper . ivy--regex-plus)
          (counsel-M-x . ivy--regex-plus))))
;          (t . ivy--regex-fuzzy))))

(use-package counsel
  :ensure t
  :bind*
  (("C-c k" . counsel-ag)
   ("C-x C-f" . counsel-find-file)))

(use-package swiper
  :ensure t
  :bind*
  (("C-s" . swiper)
   ("C-r" . swiper)
   ("C-M-s" . swiper-all)))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

(use-package projectile
  :ensure t
  :diminish ""
  :config
  (add-hook 'prog-mode-hook 'projectile-mode))

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

(use-package company
  :ensure t
  :diminish (company-mode . " ⓐ")
  :config
  (global-company-mode))

(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)))

(use-package ace-window
  :ensure t
  :bind*
  ("M-p". ace-window)
  :config
  (setq aw-dispatch-always t))

(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings))

(use-package crux
  :ensure t
  :bind*
  (("M-o" . crux-smart-open-line)
   ("s-o" . crux-smart-open-line-above)
   ("C-k" . crux-kill-whole-line)))

(use-package discover-my-major
  :ensure t
  :bind*
  (("C-h C-m" . discover-my-major)
   ("C-h M-m" . discover-my-mode)))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme))

(use-package ruby-tools
  :ensure t)

(use-package flycheck
  :ensure t
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
