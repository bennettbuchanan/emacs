(which-function-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)
(ido-mode 1)
(linum-mode 1)
(pending-delete-mode t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Add ido-vertical-mode to modes
(add-hook 'html-mode-hook 'ido-vertical-mode)

;; Add yasnippets to modes
(add-hook 'html-mode-hook 'yas-minor-mode)
(add-hook 'css-mode-hook 'yas-minor-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)

;; Add emmet to modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;; add skewer hook to respective major modes
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;; Load stuff on demand
(autoload 'skewer-start "setup-skewer" nil t)
(autoload 'skewer-demo "setup-skewer" nil t)
(autoload 'auto-complete-mode "auto-complete" nil t)

;; add my personal hooks
(add-hook 'html-mode-hook 'indent-guide-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; add sublimity
(add-to-list 'load-path "/Users/bennettbuchanan/.emacs.d/elpa/sublimity/")
(require 'sublimity)
(require 'sublimity-scroll)

;; add windmove keybindings to arrow keys
(global-set-key (kbd "C-<left>")  'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>")    'windmove-up)
(global-set-key (kbd "C-<down>")  'windmove-down)

;; add indent-region keybinding
(global-set-key (kbd "<C-tab>")  'indent-region)

;; add smex mode
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; add package download capabilities
(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")
("melpa" . "http://melpa.org/packages/")))

;; change font size
(set-face-attribute 'default nil :height 140)

;; add line numbers as global setting
(global-linum-mode t)

;; add multiple cursors key bindings
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c cmd-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-#") 'mc/mark-next-like-this)

;; add expand region key bindings
(global-set-key (kbd "C-q") 'er/expand-region)

;; add theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type (quote (bar . 1)))
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("419637b7a8c9cb43f273980f0c9879c0cbadace6b38efac0281e031772c84eb2" "f024aea709fb96583cf4ced924139ac60ddca48d25c23a9d1cd657a2cf1e4728" "c044038a267671ff0be79bba4b331ec50af0ce1c43e343e14be3010e1b42ecac" "44a53f4943ede40e2122e60f9c51b1dca3da4ba5fd8625c853c6d9358133d457" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" default)))
 '(fci-rule-color "#383838")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#d01A4E")
     (60 . "#cb4b16")
     (80 . "#b58900")
     (100 . "#b58900")
     (120 . "#b58900")
     (140 . "#7E7D7E")
     (160 . "#7E7D7E")
     (180 . "#9FAA9B")
     (200 . "#9FC59F")
     (220 . "#859900")
     (240 . "#31be67")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#268bd2")
     (320 . "#268bd2")
     (340 . "#00a74e")
     (360 . "#d33682"))))
 '(vc-annotate-very-old-color "#d33682"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; add linum-relative
(defvar relative-linum-format-string "%3d")

(add-hook 'linum-before-numbering-hook 'relative-linum-get-format-string)

(defun relative-linum-get-format-string ()
  (let* ((width (1+ (length (number-to-string
                             (count-lines (point-min) (point-max))))))
         (format (concat "%" (number-to-string width) "d")))
    (setq relative-linum-format-string format)))

(defvar relative-linum-current-line-number 0)

(setq linum-format 'relative-linum-relative-line-numbers)

(defun relative-linum-relative-line-numbers (line-number)
  (let ((offset (- line-number relative-linum-current-line-number)))
    (propertize (format relative-linum-format-string offset) 'face 'linum)))

(defadvice linum-update (around relative-linum-update)
  (let ((relative-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)

(provide 'relative-linum)

;; alter scroll behavior
    (setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
    (setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

;; include js2-mode for js-mode
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; add adaptive-line mode
(when (fboundp 'adaptive-wrap-prefix-mode)
  (defun my-activate-adaptive-wrap-prefix-mode ()
    "Toggle `visual-line-mode' and `adaptive-wrap-prefix-mode' simultaneously."
    (adaptive-wrap-prefix-mode (if visual-line-mode 1 -1)))
  (add-hook 'visual-line-mode-hook 'my-activate-adaptive-wrap-prefix-mode))

;; ace jump mode major function
;; 
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-marFk)
