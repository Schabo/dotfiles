(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq inhibit-startup-screen t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(global-display-line-numbers-mode)

(set-frame-font "MonoSpace-12")

(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(require 'ido)
(ido-mode t)
(ido-everywhere 1)

(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))

(add-hook 'after-init-hook 'global-company-mode)

(global-flycheck-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1a212b23eb9a9bedde5ca8d8568b1e6351f6d6f989dd9e9de7fba8621e8ef82d" default)))
 '(package-selected-packages (quote (flycheck ac-clang company gruber-darker-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
