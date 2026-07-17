(setq inhibit-startup-screen t)

(load-theme 'modus-vivendi t)

(set-face-attribute 'default nil
                    :family "Maple Mono"
                    :height 110)

(add-to-list 'default-frame-alist
             '(font . "Maple Mono-11"))

(set-face-attribute 'variable-pitch nil
                    :family "Maple Mono"
                    :height 110)

(set-face-attribute 'fixed-pitch nil
                    :family "Maple Mono"
                    :height 110)

(set-face-attribute 'fixed-pitch-serif nil
                    :family "Maple Mono"
                    :height 110)

(defun my/vterm-appearance ()
  (face-remap-add-relative
    'default
    :family "Maple Mono" 
    :height 1.0)
  (display-line-numbers-mode -1)
  (hl-line-mode -1))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(column-number-mode)
(global-hl-line-mode 1)

(setq scroll-conservatively 101)

(fset 'yes-or-no-p 'y-or-n-p)

(require 'use-package)

(setq use-package-always-ensure nil)

(setq backup-directory-alist
      '(("." . "~/.emacs.d/backups")))

(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/backups/" t)))

(setq auto-save-list-file-prefix
      "~/.emacs.d/backups/.saves-")

(setq org-directory "~/notes/org")

(setq org-agenda-files
      '("~/notes/org/inbox.org"
	"~/notes/org/projects.org"
	"~/notes/org/someday.org"))

(setq org-default-notes-file
      "~/notes/org/inbox.org")

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-capture-templates
      '(("t" "Inbox task" entry
	 (file+headline "~/notes/org/inbox.org" "Tasks")
	 "* TODO %?\n %U\n")
	("n" "Inbox note" entry
	 (file+headline "~/notes/org/inbox.org" "Notes")
	 "* %?\n %U\n")
	("i" "Idea" entry
	 (file+headline "~/notes/org/inbox.org" "Ideas")
	 "* %?\n %U\n")
	("p" "Project task" entry
	 (file+headline "~/notes/org/projects.org" "macAdorable")
	 "** TODO %?\n %U\n")
	("s" "Someday item" entry
	 (file+headline "~/notes/org/someday.org" "Ideas")
	 "* %?\n %U\n")
	("j" "Journal entry" entry
	 (file+headline "~/notes/org/journal.org")
	 "* %U %?\n")))

(setq org-refile-targets
      '(("~/notes/org/projects.org" :maxlevel . 2)
	("~/notes/org/someday.org" :maxlevel . 2)
	("~/notes/org/inbox.org" :maxlevel . 2)))


(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)

(setq org-agenda-custom-commands
      '(("d" "Daily dashboard"
	 ((agenda "" ((org-agenda-span 1)))
	  (alltodo "")))))


(use-package vertico
             :init
             (vertico-mode))

(use-package orderless
             :custom
             (completion-styles '(orderless basic))
             (completion-category-defaults nil))

(use-package marginalia
             :init
             (marginalia-mode))

(use-package consult)

(use-package magit
             :bind ("C-c g" . magit-status))

(use-package vterm
             :commands vterm
             :custom
             (vterm-shell "/run/current-system/sw/bin/fish")
             (vterm-max-scrollback 10000)
             :hook
             (vterm-mode . my/vterm-appearance))

(use-package pdf-tools
             :mode ("\\.pdf\\'" . pdf-view-mode)
             :config
             (pdf-tools-install)
             (setq-default pdf-view-display-size 'fit-page)
             (setq pdf-view-use-scaling t)
             (setq pdf-view-resize-factor 1.1)

             :hook
             (pdf-view-mode . (lambda ()
                                (display-line-numbers-mode -1)
                                (hl-line-mode -1)
                                (pdf-view-midnight-minor-mode 1))))

(use-package which-key
             :init
             (which-key-mode))

(use-package org
             :hook (org-mode . visual-line-mode)
             :custom
             (org-startup-indented t)
             (org-hide-emphasis-markers t)
             (org-ellipsis " ▼")
             (org-src-fontify-natively t)
             (org-src-tab-acts-natively t)
             (org-edit-src-content-indentation 0))

(use-package org-modern
             :hook (org-mode . org-modern-mode))

(use-package ace-window
             :bind ("M-o" . ace-window))

(use-package ox-hugo
  :after ox)

(use-package markdown-mode
  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))
  :hook
  (markdown-mode . visual-line-mode)
  (markdown-mode . variable-pitch-mode)
  :custom
  (markdown-command "pandoc")
  (markdown-fontify-code-blocks-natively t)
  (markdown-hide-urls nil)
  (markdown-header-scaling t))

(use-package grip-mode
  :after markdown-mode
  :bind
  (:map markdown-mode-command-map
	("g" . grip-mode)))

;; ----------------------------------------
;; MacAdorable welcome screen
;; ----------------------------------------

(defvar my/welcome-buffer-name "*MacAdorable*")

(defun my/open-welcome-screen ()
  "Open the MacAdorable welcome screen."
  (interactive)

  (let ((buffer (get-buffer-create my/welcome-buffer-name)))
    (with-current-buffer buffer
      (setq buffer-read-only nil)
      (erase-buffer)

      (insert
       "\n"
       "              .------------------.\n"
       "             /                    \\\n"
       "            |     MacAdorable      |\n"
       "            |                      |\n"
       "            |        _[_]_         |\n"
       "            |       /     \\        |\n"
       "            |      |  Nix  |       |\n"
       "            |       \\_____/        |\n"
       "             \\                    /\n"
       "              '------------------'\n"
       "\n"
       "                 Welcome, momo.\n"
       "\n"
       "  Files and buffers\n"
       "    C-x C-f      Open a file\n"
       "    C-x b        Switch buffer\n"
       "    C-x 5 2      New frame\n"
       "\n"
       "  MacAdorable workflow\n"
       "    C-c g        Open Magit\n"
       "    C-c a        Open Org Agenda\n"
       "    C-c c        Capture an Org entry\n"
       "    M-x vterm    Open a Fish terminal\n"
       "\n"
       "  Writing and reading\n"
       "    C-c C-e      Org export menu\n"
       "    M-x grip-mode  Toggle Markdown preview\n"
       "    C-x C-f      Open a PDF with pdf-tools\n"
       "\n"
       "  Help\n"
       "    C-h t        Emacs tutorial\n"
       "    C-h k        Describe a key\n"
       "    M-x          Run a command\n"
       "\n"
       "  Press q to close this screen.\n")

      (goto-char (point-min))
      (special-mode)
      (visual-line-mode -1)
      (display-line-numbers-mode -1)
      (hl-line-mode -1)

      (local-set-key (kbd "q") #'quit-window))

    (switch-to-buffer buffer)))

(setq inhibit-startup-screen t
      initial-buffer-choice #'my/open-welcome-screen)

(keymap-global-set "C-c w" #'my/open-welcome-screen)
