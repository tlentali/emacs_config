(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" default)))
 '(package-selected-packages
   (quote
    (monokai-theme tangotango-theme sublime-themes py-autopep8 material-theme flycheck elpy ein better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))


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
(global-linum-mode t) ;; enable line numbers globally

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

;; THEME
;; --------------------------------------
;; theme from sublime text
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'tangotango t)
(load-theme 'monokai t)

;; background terminal #300a24

;; Ditaa
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))

;; OS specific to show ditaa jar

(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows

  (progn
    (setq-default ispell-program-name "C:/bin/Aspell/bin/aspell.exe")
      (setq org-ditaa-jar-path "c:/bin/ditaa/ditaa.jar")
      )
  )
 ((string-equal system-type "gnu/linux") ; Linux
  (progn
    (setq x-select-enable-clipboard t)
      (setq org-ditaa-jar-path "/usr/bin/ditaa")
      )
  )
     )

;;typed text replaces the selection if the selection is active
(delete-selection-mode 1)

;; no tabs
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 4) ; set tab width to 4 for all buffers

;; no line number
(global-linum-mode 0)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'sql)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
