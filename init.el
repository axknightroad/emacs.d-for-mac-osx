(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default)))
 '(inhibit-startup-screen t)
 '(scroll-bar-mode nil)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(tool-bar-position (quote left)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "apple" :slant normal :weight normal :height 120 :width normal)))))

(set-fontset-font
    (frame-parameter nil 'font)
    'han
    (font-spec :family "Hiragino Sans GB" ))


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'molokai t)
(global-linum-mode t)
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional


;;系统本身内置的智能自动补全括号
(electric-pair-mode t)
;;使用易码肆24内嵌的功能：
(require 'electric)
;;编辑时智能缩进，类似于C-j的效果——这个C-j中，zencoding和electric-pair-mode冲突
(electric-indent-mode t)
;;系统本身内置的智能自动补全括号
(electric-pair-mode t)
;;特定条件下插入新行
;(electric-layout-mode t)
;;end

;;设置光标为线条状
(setq-default cursor-type 'bar)

;;设置是否显示光标所在列号
(column-number-mode t)

(setq ns-pop-up-frames nil)


;;自动补完时间
(setq semantic-idle-scheduler-idle-time 1)


;yasnippet
(add-to-list 'load-path "/Users/axel/.emacs.d/elpa/yasnippet-20140729.1240")
(require 'yasnippet)
(setq yas/prompt-functions
   '(yas/dropdown-prompt yas/x-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt))
(yas/global-mode 1)
(yas/minor-mode-on) ; 以minor mode打开，这样才能配合主mode使用



; auto complete
(add-to-list 'load-path "/Users/axel/.emacs.d/elpa/auto-complete-20140618.2217")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/axel/.emacs.d/elpa/auto-complete-20140618.2217")
(ac-config-default)

(setq ac-use-quick-help nil)
(setq ac-auto-start 1) ;; 输1个字符才开始补全
(global-set-key "\M-]" 'auto-complete)  ;; 补全的快捷键，用于需要提前补全
;; Show menu 0.8 second later
(setq ac-auto-show-menu 0.8)
;; 选择菜单项的快捷键
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
;; menu设置为12 lines
(setq ac-menu-height 12)

;; web-mode
(add-to-list 'ac-modes 'web-mode)
(defun ac-web-mode-setup()
  (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))
(add-hook 'web-mode-hook 'ac-web-mode-setup)

;; html-mode
(add-to-list 'ac-modes 'html-mode)
(defun ac-html-mode-setup()
  (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))
(add-hook 'html-mode-hook 'ac-html-mode-setup)

;;jsp-mode
(defun jsp-mode () (interactive)
  (multi-mode 1
      'html-mode
      '("<%--" indented-text-mode)
      '("<%@" indented-text-mode)
      '("<%=" html-mode)
      '("<%" java-mode)
      '("%>" html-mode)))


;
(add-to-list 'load-path "/Users/axel/.emacs.d/")
(require 'multi-mode)

;;multi-mode
;((autoload 'multi-mode
;   "multi-mode"
;   "Allowing multiple major modes in a buffer."
;   t)

; (defun multi-c-fundamental-mode () (interactive)
 ; (multi-mode 1
;	      'c-mode
;	      '(\"/*\" fundamental-mode my-fundamental-setup)
;	      '(\"*/\" c-mode)))

; (setq auto-mode-alist
;      (cons '("\\.[ch]$" . multi-c-fundamental-mode)
;	     auto-mode-alist)

(add-to-list 'auto-mode-alist '("\\.jsp$" . jsp-mode))


(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

(require 'window-numbering)
(window-numbering-mode 1)


;;command + left, 回到行首
(define-key key-translation-map [(s-left)] [(control a)])
;;command + right, 回到行尾
(define-key key-translation-map [(s-right)] [(control e)])
;;command + delete, 删除从光标到行首的字符
(global-set-key [(s-backspace)] 'kill-line-before-cursor)

(defun kill-line-before-cursor (&optional arg)
  "kill-line-before-cursor"
  (interactive "P")

  (while (not(bolp))
  (delete-backward-char 1))
)
