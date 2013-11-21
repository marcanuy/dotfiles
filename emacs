;;
;;
;; graphviz-dot-mode
(load-file "~/.elisp/graphviz-dot-mode/graphviz-dot-mode.el")
;; php-mode
(load-file "~/.elisp/php-mode/php-mode.el")

;; helm-mode
;;   M-x helm-mini
;;   M-x helm-mode for EMacs commands
(add-to-list 'load-path "~/.elisp/helm/")
(require 'helm-config)
;;(global-set-key (kbd "C-c h") 'helm-mini)
;;;; autoload hel-mode
;; (helm-mode 1)

;; bookmark-plus
(add-to-list 'load-path "~/.elisp/bookmark-plus/")
(require 'bookmark+)
;; joomla-mode
(load-file "~/.elisp/joomla-mode/joomla-mode.el")
;; web-mode
(load-file "~/.elisp/web-mode/web-mode.el")
;; twittering-mode
;; Execute `M-x twit` to run twittering-mode.
(add-to-list 'load-path "~/.elisp/twittering-mode/")
(require 'twittering-mode)
;; dired-plus
(load-file "~/.elisp/dired-plus/dired+.el")
;;
;; ace jump mode major function
;; 
(add-to-list 'load-path "~/.elisp/ace-jump-mode/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; load ibuffer instead of buffermenu
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Flymake error reporting for PHP
;; error_reporting option in php.ini needs to include E_PARSE
;; in order for php to report parsing error details.
;; e.g. php.ini:
;; error_reporting = E_ERROR|E_COMPILE_ERROR|E_CORE_ERROR|E_PARSE
(require 'flymake)
(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	  (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))
(add-to-list 'flymake-err-line-patterns 
  '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))
(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))

(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))
(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)

;; todo: ask for project directory
;; using ctags because etags did not manage static declarations
(defun compile-tags ()
  "Compile tags for the current project"
  (interactive)
  (cd "/home/marcelo/public_html/conversion_en/")
  (compile "find . -name \"*.php\" -print | xargs ctags -e -f TAGS --language-force=php "))

;; sets default web browser
;; other options: browse-url-*
(setq browse-url-browser-function 'browse-url-w3m)

;; disable splash screen

;; disable scrollbar
;; (toggle-scroll-bar -1)

;; disable toolbar
(tool-bar-mode -1)

;; disable bell function
;;(setq ring-bell-function 'ignore)

;; current buffer name in title bar
(setq frame-title-format "%b")

;; Show line and column number
(line-number-mode 1)
(column-number-mode 1)

;;  Global font lock mode ON
(global-font-lock-mode t)

;; show parenthesis mode
 (show-paren-mode 1)

;; Make the cursor blink
;; (blink-cursor-mode 1)

;; Make emacs use the clipboard
;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; default coding
 (prefer-coding-system 'utf-8)

;; set default font
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" 
;; 			 :inverse-video nil :box nil :strike-through nil 
;; 			 :overline nil :underline nil :slant normal :weight normal 
;; 			 :height 79 :width normal :foundry "unknown" 
;; 			 :family "DejaVu Sans Mono"))))
 )

;; Big global font size
;; (set-face-attribute 'default nil :height 300)
(defun resize-font (arg)
  "Sets Emacs font size."
  (interactive "P")
  (set-face-attribute 'default nil :height (or arg 200))
  (message "set face attribute:%s" arg))
(global-set-key
 (kbd "C-c C-w C-f")
 'resize-font)

;; Navigate windows with arrow keys
(global-set-key [M-left]  'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up]    'windmove-up)
(global-set-key [M-down]  'windmove-down)

;;Enable EDE (Project Management) features
(global-ede-mode 1)

;;Enable EDE (Project Management) features
(global-ede-mode 1)

;; Auto-insert/close bracket pairs
(electric-pair-mode 1)

;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; Remove tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Window colors
;;(set-background-color "black")
;;(set-foreground-color "white")

;; Lines soft wrapped at word boundary
;; (global-visual-line-mode 1)

;; Stop creating backup~ files
;; (setq make-backup-files nil)
;; Stop creating #autosave# files
;; (setq auto-save-default nil)

;; Start server from config (started in wm)
;; (server-start)
