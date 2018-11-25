;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      smooth-scrolling
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      exec-path-from-shell
		      popwin
		      smart-mode-line
		      ;; --- Major Mode ---
		      js2-mode
		      ;; --- Minor Mode ---
		      nodejs-repl
		      ;; --- Themes ---
		      smart-mode-line-atom-one-dark-theme
		      zenburn-theme
		      monokai-theme
		      sublime-themes
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)) ;; Find Executable Path on OS X


;; -----------------------------------------------------------------------------------------------

;; config for popwin
(require 'popwin)
(popwin-mode t)


;; smooth-scrolling mode on
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)


;; configure for smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;; hungry delete t
(require 'hungry-delete)
(global-hungry-delete-mode)

;; configure for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; company mode ready
(global-company-mode t)



;;-------------------------------------------------------------------------------
(provide 'init-packages)
