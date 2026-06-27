(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package which-key
  :config (which-key-mode 1))

(use-package vertico
  :init (vertico-mode 1))

(use-package orderless
  :init (setq completion-styles '(orderless basic)))

(use-package consult)

;; Themes and shii
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin t))

;; File navigation

(use-package project
  :ensure nil)

(use-package consult
  :init
  (consult-customize
   consult-ripgrep consult--source)
  :config
  (global-set-key (kbd "C-s") #'consult-line))

(use-package consult-project-extra
  :after consult)

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents  . 5)
                           (projects . 5)
                           (agenda   . 5)))
  :config
  (dashboard-setup-startup-hook))

(use-package zetteldeft
  :init
  (setq zetteldeft-directory (expand-file-name "~/notes/"))
  (setq zetteldeft-default-signature "—"))

(use-package markdown-mode)

(use-package term)

(use-package dired
  :ensure nil)


(use-package pdf-tools)

(use-package emms
  :ensure t
  :config
  (require 'emms-setup)
  (require 'emms-browser)
  (require 'emms-mode-line)
  (require 'emms-playing-time)
  (emms-all)
  (emms-default-players)
  (emms-mode-line 1)
  (emms-playing-time 1))

(use-package elfeed
  :ensure t)

(provide 'packages)

