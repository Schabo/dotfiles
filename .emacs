
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
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

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

;; Install and enable use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

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


;; TODO:
;; company mode
;; flycheck mode
;; M-x keybind
;; Install theme
;; org, for TODO
