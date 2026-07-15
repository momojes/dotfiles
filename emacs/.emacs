(require 'use-package)

(setq inhibit-startup-screen t)

(setq use-package-always-ensure nil)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(column-number-mode 1)
(global-hl-line-mode 1)

(setq scroll-conservatively 101)

(fset 'yes-or-no-p 'y-or-n-p)

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nill))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package consult)

(use-package magit
  :bind ("C-c g" . magit-status))

(use-package vterm
  :commands vterm
  :custom
  (vterm-shell "/run/current-system/sw/bin/fish"))

(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install))
