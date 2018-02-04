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
