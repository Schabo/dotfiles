(require 'package)
(add-to-list 'package-archives '("Melpa", "https://melpa.org/packages/") t)

(package-initialize)

## Disable start screen
(setq inhibit-startup-screen t)

## Disable toolbar, menubar and scrollbar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

## Enable linenumbering
(global-display-line-numbers-mode)

## Change save dir
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

## Install and enable use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package))
