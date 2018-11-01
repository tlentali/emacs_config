(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Start full screen
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    py-autopep8
    neotree
    multiple-cursors
    sql
    olivetti
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message

;;typed text replaces the selection if the selection is active
(delete-selection-mode 1)

;; no tabs
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 4) ; set tab width to 4 for all buffers

;; no line number
(global-linum-mode 0)

;; Set default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height '100
                    :weight 'normal
                    :width 'normal)

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
(elpy-use-ipython)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;get anaconda python3 interpreter
(setq python-shell-interpreter "/home/tom/anaconda3/bin/python3")

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
))

;; THEME
;; --------------------------------------

;; theme from sublime text
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'sexy-monochrome t)
;;(load-theme 'monokai t)
;;(load-theme 'material t) ;; load material theme

;; background terminal #300a24

(require 'sql)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(autoload 'markdown-mode "markdown-mode"
"Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


; Function for distraction-free mode
;; enabled by F9 key
(defun prose-mode-olivetti () 
    "Switching to Prose Mode Olivetti"
    (interactive)
    (olivetti-mode)
    (setq mode-line-format nil)
    (setq olivetti-body-width 0.8))
(global-set-key [f9] 'prose-mode-olivetti)

