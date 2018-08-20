(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

;;(add-to-list 'package-archives
;;             '("marmalade" . "http://marmalade-repo.org/packages/"))


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
;;(load-theme 'material t) ;; load material theme

;; no line number
(global-linum-mode 0) ;; enable line numbers globally

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
;;(elpy-use-ipython)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;;(require 'py-autopep8)
;;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;get anaconda python3 interpreter
;;(setq python-shell-interpreter "/home/tom/anaconda3/bin/python3")


;; THEME
;; --------------------------------------
;; theme from sublime text
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'tangotango t)
(load-theme 'monokai t)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ditaa . t)
   ))

;; reveal
(setq org-reveal-root "file:///home/tom/node_modules/reveal")

;; org mode agenda
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/source/test_org/test.org"))

;; typed text replaces the selection if the selection is active
(delete-selection-mode 1)

;; tree file
(require 'neotree)
(global-set-key [f8] 'neotree-toogle) 

;; sql
(require 'sql)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;virtual env
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; note that setting `venv-location` is not necessary if you
;; use the default location (`~/.virtualenvs`), or if the
;; the environment variable `WORKON_HOME` points to the right place
(setq venv-location "/home/tom/.virtualenvs")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit virtualenvwrapper tangotango-theme sublime-themes py-autopep8 ox-reveal neotree multiple-cursors monokai-theme material-theme flycheck elpy ein better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
