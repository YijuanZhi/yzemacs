;;  Use f1 to open init.el file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; (global-set-key (kbd "<f1>") 'open-my-init-file)

;; configure for nodejs(running js files)
(require 'nodejs-repl)
(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-buffer)))

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(require 'recentf)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-c c g") 'counsel-git)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'reveal-in-osx-finder)
(global-set-key (kbd "C-c f") 'reveal-in-osx-finder)()


(provide 'init-hotkeys)
