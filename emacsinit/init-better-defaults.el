;; when files changed from external, it is going to change the files inside emacs as well
(global-auto-revert-mode t)

;; back up and autosave functions disabled
(setq make-backup-files nil)
(setq auto-save-default nil)

;; delete selection
(delete-selection-mode 1)

;; show hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; recentf setting
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-menu-item 10)

;; configure for setting js2 mode as default for js files
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

;; turn off alarm sound (noice!)
(setq ring-bell-function 'ignore)

;;better indent
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;;hippie-expand
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))


(fset 'yes-or-no-p 'y-or-n-p)

;; dired mode optimized
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-dwim-target t)


(provide 'init-better-defaults)
