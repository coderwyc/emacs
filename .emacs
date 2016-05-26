(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(compilation-message-face (quote default))
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes (quote ("38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" default)))
 '(flymake-allowed-file-name-masks (quote (("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init) ("\\.xml\\'" flymake-xml-init) ("\\.html?\\'" flymake-xml-init) ("\\.cs\\'" flymake-simple-make-init) ("\\.p[ml]\\'" flymake-perl-init) ("\\.php[345]?\\'" flymake-php-init) ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) ("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup) ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) ("\\.tex\\'" flymake-simple-tex-init) ("\\.idl\\'" flymake-simple-make-init))))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors (quote (("#3E3D31" . 0) ("#67930F" . 20) ("#349B8D" . 30) ("#21889B" . 50) ("#968B26" . 60) ("#A45E0A" . 70) ("#A41F99" . 85) ("#3E3D31" . 100))))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(org-agenda-files (quote ("c:/Casilink/CasiDevKit/cygwin/opt/casilink/gtd.org")) t)
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(weechat-color-list (unspecified "#272822" "#3E3D31" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

;;package management melpa
(require 'package)
(add-to-list 'package-archives'
  ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
  ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; auto-complete-mode
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; tab and space 
;; when true, emacs use mixture of tab and space to achieve offset 
(setq-default indent-tabs-mode nil) 
;; control length used to offset. 
(setq-default c-basic-offset 4) 
;; control how emacs explain TAB. 
(setq-default tab-width 4) 

;; open *.nc file using c-mode
(add-to-list 'auto-mode-alist'("\\.nc\\'" . c-mode)) 

;;Unicad is short for Universal Charset Auto Detector.
;; It is an Emacs-Lisp port of Mozilla Universal Charset Detector.
(require 'unicad)

;;Markdown mode setting
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;chinese-gbk coding system lanuch shell
(defun gshell()
  (interactive)
  (let ((coding-system-for-read 'chinese-gbk)
	(coding-system-for-write 'chinese-gbk))
    (call-interactively (shell))))

;; YASnippet
(require 'yasnippet)
(yas/global-mode 1)
(yas/minor-mode-on)

;; org-mode command global-key-binding 
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitch)

;;diabale flymake
(load "flymake" nil)
(delete '("\\.py\\'" elpy-flymake-python-init) flymake-allowed-file-name-masks)

(global-set-key (kbd "C-SPC") 'nil)
;;(global-set-key (kbd "C-@") 'set-mark-command)
;; using F1 key to set-mark
(global-set-key [f1] 'set-mark-command)
;; using F2 key to disable or enable auto-complete-mode
(global-set-key [f2] 'auto-complete-mode)
;; using F3 key to diaable or enable flymake-mode
(global-set-key [f3] 'flymake-mode)
(require 'neotree)
;;F8 to neotree-toglle
(global-set-key [f8] 'neotree-toggle)
;;Some useful command with NeoTree---M-x neotree-toggle

;; default coding system
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; org-mode setq
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))
(setq org-agenda-files (list "C:/Casilink/CasiDevKit/cygwin/opt/casilink/gtd.org"))


;;no backup 
;;(setq make-backup-files nil)
;; all backups files goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; M-x my/open-dot-emacs open file ~/.emacs
(defun my/open-dot-emacs()
  (interactive)
  (find-file "~/.emacs"))

;; smex setting
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; Sublime Text3 ShortCut Customization
(global-set-key (kbd "C-i") 'indent-region)
(global-set-key (kbd "C-S-k") 'kill-whole-line)
(global-set-key (kbd "C-/") 'comment-dwim)

(defvar sublime-text-control-L-active nil)
(defun sublime-text-control-L-deactivate ()
  (setq sublime-text-control-L-active nil))
 
(add-hook 'deactivate-mark-hook #'sublime-text-control-L-deactivate)
 
(define-key global-map (kbd "C-l")
  (defun sublime-text-control-L ()
    (interactive)
    (when (not sublime-text-control-L-active)
      ;; initializing the mark
      (setq sublime-text-control-L-active t)
      (move-beginning-of-line nil)
      (set-mark (point))
      (activate-mark)
      (setq sublime-text-control-L-active t))
    ;; set the point
    (move-end-of-line nil)
    (forward-line)))

;; multiple-cursor mode 
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; Ctrl+Enter like Sublime text 3
(defun my/new-line ()
  (interactive)
  (move-end-of-line 1)
  (newline 1)
  (indent-according-to-mode))
(global-set-key (kbd "C-o") 'my/new-line)

(defun my/insert-line-before (times)
  (interactive "p")
  (save-excursion
    (move-beginning-of-line 1)
    (newline times)))
(global-set-key (kbd "C-S-o") 'my/insert-line-before)

;;Sublime text theme monokai
(load-theme 'monokai t)

;; Setting English Font
(set-face-attribute
 'default nil :font "DejaVu Sans Mono 12")

;; Setting Chinese Font
(defun my/chinese-font-setting()
  (interactive)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft Yahei" :size 16))))
(global-set-key [f5] 'my/chinese-font-setting)

;; redo system
(require 'redo+)
(global-set-key (kbd "C-y") 'redo)

;; pomodoro timer
(require 'pomodoro) 
(pomodoro-add-to-mode-line)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
