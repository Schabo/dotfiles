
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(add-to-list 'package-archives '("Melpa" . "https://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Disable start screen
(setq inhibit-startup-screen t)

;; Disable toolbar, menubar and scrollbar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Enable linenumbering
(global-display-line-numbers-mode)

;; Change save dir
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-old-versions 20
      kept-new-versions 5)

;; Change yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Bind M-x
(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))

;; Remove whitespace at end of lines when saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Install and enable use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Install theme
(use-package gruber-darker-theme :ensure t)

;; Install ido
(use-package ido
	     :config
	     (setq ido-everywhere 1)
	     (ido-mode))

;; Install elpy
(use-package elpy
	     :ensure t
	     :init
	     (elpy-enable))

;; Install flycheck
(use-package flycheck
	     :ensure t
	     :config
	     (add-hook 'after-init-hook 'global-flycheck-mode))

;; Install company-mode
(use-package company
	     :ensure t
	     :config
	     (add-hook 'after-init-hook 'global-company-mode))

;; Install Rainbow-delimiters
(use-package rainbow-delimiters
	     :ensure t
	     :config
	     (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; Install Magit
(use-package magit
	     :ensure t
	     :bind ("C-x g" . magit-status))

;; Install Markdown
(use-package markdown-mode
	     :ensure t
	     :commands (markdown-mode gfm-mode)
	     :mode (("README\\.md\\'" . gfm-mode)
		    ("\\.md\\'" . markdown-mode)
		    ("\\.markdown\\'" . markdown-mode))
	     :init (setq markdown-command "multimarkdown"))

;; Install Org mode
(use-package org
	     :ensure t
	     :mode (("\\.org$" . org-mode))
	     :config
	     (progn
	       (global-set-key (kbd "C-c l") 'org-store-link)
	       (global-set-key (kbd "C-c a") 'org-agenda)
	       (setq org-log-done 1)
	       (setq org-agenda-files (list "~/.emacs.d/org_docs/Notes.org"))))
	     

;; TODO:
;; org, for TODO
