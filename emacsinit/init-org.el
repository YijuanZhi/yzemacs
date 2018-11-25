;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)
;; org source code key word highlight
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))



(provide 'init-org)
