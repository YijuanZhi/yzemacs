;;  Use f2 to open init.el file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(add-to-list 'load-path "~/.emacs.d/emacsinit/")
(require 'init-packages)



;; when files changed from external, it is going to change the files inside emacs as well
(global-auto-revert-mode t)






;;------------------------------------------------------------------------------




;; configure for nodejs(running js files)
(require 'nodejs-repl)
(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-buffer)))



;; configure for js2 mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)



	  


(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)




;; bar mode
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'bar)

;; (electric-indent-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t)



;; back up and autosave functions disabled
(setq make-backup-files nil)
(setq auto-save-default nil)


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-menu-item 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "f66ffeadda7b52d40c8d698967ae9e9836f54324445af95610d257fa5e3e1e21" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages (quote (gruvbox-theme zenburn-theme dracula-theme company)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(js2-external-variable ((t (:foreground "dark gray")))))






;; delete selection
(delete-selection-mode 1)

;; initial frame
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; show hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(global-hl-line-mode 1)

;; theme setting
;; zenburn, monokai, dracula
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

;; org source code key word highlight
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))
;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; default font set
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 140
                    :weight 'normal
                    :width 'normal)

;; turn off alarm sound (noice!)
(setq ring-bell-function 'ignore)
