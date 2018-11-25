;; bar mode
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'bar)

;; (electric-indent-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t)

;; initial frame
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode 1)

;; theme setting
;; zenburn, monokai, dracula
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

(set-frame-font "Hack 14" nil t)

;; smart mode line
(setq sml/no-confirm-load-theme t)
(require 'smart-mode-line)
(setq sml/theme 'atom-one-dark)
(sml/setup)

(provide 'init-ui)
