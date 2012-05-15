;;; Commentary:
;; Use this mode for editing files in the dot-language (www.graphviz.org and
;; http://www.research.att.com/sw/tools/graphviz/).
;;
;; To use graphviz-dot-mode, add
 (load-file "~/.emacs.d/graphviz-dot-mode/graphviz-dot-mode.el")
;; to your .emacs or ~/.xemacs/init.el
;;
;; The graphviz-dot-mode will do font locking, indentation, preview of graphs
;; and eases compilation/error location. There is support for both GNU Emacs
;; and XEmacs.
;;
;; Font locking is automatic, indentation uses the same commands as
;; other modes, tab, M-j and C-M-q. Insertion of comments uses the
;; same commands as other modes, M-; . You can compile a file using
;; M-x compile or C-c c, after that M-x next-error will also work.
;; There is support for viewing an generated image with C-c p.

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

;; column numbers
 (setq column-number-mode t)

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
;; (custom-set-faces
;;  '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" 
;; 			 :inverse-video nil :box nil :strike-through nil 
;; 			 :overline nil :underline nil :slant normal :weight normal 
;; 			 :height 79 :width normal :foundry "unknown" 
;; 			 :family "DejaVu Sans Mono")))))

;;Enable EDE (Project Management) features
(global-ede-mode 1)

;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)


(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; remove tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; changing colors
(set-background-color "black")
(set-foreground-color "white")

;;start server from config (started in wm)
;;(server-start)