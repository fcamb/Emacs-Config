;; BASIC SETTINGS
(setq inhibit-startup-message t)

;;(scroll-bar-mode -1)       ; Disable visible scroll bar
(tool-bar-mode -1)         ; Disable toolbar
(menu-bar-mode -1)         ; Disable menu bar
(tooltip-mode -1)          ; Disable tooltips ?
(set-fringe-mode 10)       ; Give some breathing room
(set-message-beep 'silent) ; Disable annoying beep sound

;; VISIBLE BELL
(setq visible-bell t)

(set-face-attribute 'default nil :font "Consolas" :height 130)

;;(setq word-wrap t)
(visual-line-mode t)
(column-number-mode)
(global-display-line-numbers-mode t)
(setq-default cursor-type 'bar)
(setq comment-multi-line nil)
(setq comment-start "/* ")
(setq comment-end " */")

;; KEYBINDS
(keymap-global-set "C-/" 'comment-region)
(keymap-global-set "M-/" 'uncomment-region)
(keymap-global-set "C-j" 'scroll-up-command)
(keymap-global-set "C-k" 'scroll-down-command)
;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1))
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1))
(global-set-key [(control down)] 'gcm-scroll-down)
(global-set-key [(control up)] 'gcm-scroll-up)

;; CUA MODE
;; (require 'cua)
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

;; THEMES

;;(load-theme 'wombat)

;;(setq custom-file "~/.emacs.d/custom-file.el")
;;(load-file custom-file)
;;(load-theme 'github-dark-vscode)

;;(setq custom-file "~/.emacs.d/elpa/github-theme-20170630.2201/github-theme.el")
;;(load-file custom-file)
;;(load-theme 'github)

;;(setq custom-file "~/.emacs.d/elpa/github-modern-theme-20171109.1251/github-modern-theme.el")
;;(load-file custom-file)
;;(load-theme 'github-modern)

;;(setq custom-file"~/.emacs.d/elpa/github-dark-vscode-theme-20231011.2034/github-dark-vscode-theme.el")
;;(load-file custom-file)
;;(load-theme 'github-dark-vscode)

;;(setq custom-file "~/.emacs.d/elpa/vs-dark-theme-20240605.134/vs-dark-theme.el")
;;(load-file custom-file)
;;(load-theme 'vs-dark)

;;(setq custom-file "~/.emacs.d/elpa/blackboard-theme-20161216.656/blackboard-theme.el")
;;(load-file custom-file)
;;(load-theme 'blackboard t)

;;(setq custom-file "~/.emacs.d/elpa/elune-theme-20231009.1709/elune-theme.el")
;;(load-file custom-file)
;;(load-theme 'elune t)

;;(setq custom-file "~/.emacs.d/elpa/flatland-theme-20171113.1521/flatland-theme.el")
;;(load-file custom-file)
;;(load-theme 'flatland t)

;;(setq custom-file "~/.emacs.d/elpa/anti-zenburn-theme-20180712.1838/anti-zenburn-theme.el")
;;(load-file custom-file)
;;(load-theme 'anti-zenburn)

;;(setq custom-file "~/.emacs.d/elpa/minimal-theme-20190113.2132/minimal-black-theme.el")
;;(load-file custom-file)
;;(load-theme 'minimal-light)

;;(setq custom-file "~/.emacs.d/elpa/hc-zenburn-theme-20150928.1633/hc-zenburn-theme.el")
;;(load-file custom-file)
;;(load-theme 'hc-zenburn)

(setq custom-file "~/.emacs.d/elpa/gruvbox-theme-20240615.432/gruvbox-dark-hard-theme.el")
(load-file custom-file)
(load-theme 'gruvbox)

;; PACKAGES
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents(package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;(use-package ivy
;;  :diminish
;;  :config (ivy-mode 1))
(use-package treemacs
   :ensure t
   :bind
    (:map global-map
	    ([f8] . treemacs)
	    ("C-<f8>" . treemacs-select-window)
	    )
  :config
  (setq treemacs-is-never-other-window t)
  (setq treemacs-run-in-every-buffer t)
  (setq treemacs-space-between-root-nodes nil))


;; LSP MODE
;;(use-package lsp-mode
;;  :commands (lsp lsp-deferred)
;;  :ensure t)
;;(add-hook 'java-mode-hook #'lsp)
;;(add-hook 'c-mode-hook #'lsp)
;;(add-hook 'c++-mode-hoo #'lsp)
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (c-mode . lsp)
  (c++-mode . lsp)
  (java-mode . lsp)
  :commands lsp lsp-deffered)
(use-package lsp-java
  :ensure t
  :init
  (setenv "JAVA_HOME" "C:/JavaSDK/jdk-22.0.1/")
  (setq lsp-java-java-path "C:/JavaSDK/jdk-22.0.1/bin/java")
  :config
  :hook
  ('java-mode-hook . lsp-java)
  :commands lsp lsp-deffered)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(use-package flycheck
  :ensure t
  :config
  :hook
  ('after-init-hook #'global-flycheck-mode))

;;(use-package lsp-ui)
;;(use-package lsp-java)
;;(require 'lsp-mode)
;;(require 'lsp-java)
;;(add-hook 'java-mode-hook #'lsp)
;;(add-hook 'c-mode-hook #'lsp)
;;(add-hook 'c++-mode-hook #'lsp)
