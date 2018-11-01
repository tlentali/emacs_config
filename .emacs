;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
    (ssh neotree monokai-theme tangotango-theme sublime-themes py-autopep8 material-theme flycheck elpy ein better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



 (require 'package)

 (add-to-list 'package-archives
        '("melpa" . "http://melpa.org/packages/") t)



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


(require 'sql)

(require 'ssh)
(defun connect-remote ()
  (interactive)
  (dired "thomas.lentali@a06datasc003.cdbdx.biz: /home/CDBDX/thomas.lentali/"))
;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)

;; THEME
;; --------------------------------------
;; theme from sublime text
(add-to-list 'custom-theme-load-path "c:/Users/thomas.lentali/AppData/Roaming/.emacs.d/themes")
;;(load-theme 'tangotango t)
(load-theme 'monokai t)

;;typed text replaces the selection if the selection is active
(delete-selection-mode 1)

;; no line number
(global-linum-mode 0)

;; no tabs
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 4) ; set tab width to 4 for all buffers

