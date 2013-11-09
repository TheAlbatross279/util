;; Red Hat Linux default .emacs initialization file

;; don't show annoying splash screen on startup
(setq inhibit-splash-screen t)
;(setq initial-buffer-choice "~")

;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; Turn on font-lock mode for Emacs
(cond ((not running-xemacs)
       (global-font-lock-mode t)
))

;(set-default-font "7x14")
(set-default-font "6x13")

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Enable wheelmouse support by default
(if (not running-xemacs)
    (require 'mwheel) ; Emacs
  (mwheel-install) ; XEmacs
)

;;
;; Benjamin Ferrari's xml pretty-print function
;; found at http://sinewalker.wordpress.com/2008/06/26/pretty-printing-xml-with-emacs-nxml-mode/
;;
(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

;;;;;;
;;;
;;; sbk's general look and feel/behavior preferences...
;;;

;; wdired mode for interactive file renaming
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; enable auto-compression-mode
(auto-compression-mode t)

;; turn on transient mark mode for color-hilights and regional ops
(transient-mark-mode 1)

;; after emerge nxml-mode (w/env ACCEPT_KEYWORDS="~x86")
;(load "/usr/share/emacs/site-lisp/site-gentoo")

;;(set-background-color "gray10")  ;cyan, SkyBlue4, dark slate gray, dark slate blue, gray10
;;(set-foreground-color "gainsboro")  ;black, thistle1, gainsboro, powder blue
;;(set-cursor-color "gainsboro")
;(set-background-color "white")  ;cyan, SkyBlue4, dark slate gray, dark slate blue, gray10
;(set-foreground-color "gray10")  ;black, thistle1, gainsboro, powder blue
;(set-cursor-color "gray10")

;(setq default-frame-alist '((top . 1) (left . 680) (width . 170) (height . 85)))
(setq next-line-add-newlines nil)

(setq inferior-lisp-program "/usr/bin/clisp")

(setq column-number-mode t)
(setq display-time-day-and-date t)
(setq display-time-mode 1)

; install nXhtml (includes csharp-mode)
;(load "~/.emacs.d/nxhtml/autostart.el")
;(require 'csharp-mode)

;(require 'sudoku)

;(set-language-environment "English")
(set-language-environment "UTF-8")

; configuration for tramp
(setq tramp-default-method "ssh")

; Keep cursor at the bottom of compilation output
(setq compilation-scroll-output t)

;;;
;;; ...sbk
;;;
;;;;;;

;;;
;;; Load emacs-ide.el from "current" dir.
;;;
(setq load-path (cons "~/.emacs.d/" load-path))
(load "emacs-ide.el")

;(load "~/.emacs.d/color-theme.el")
;(color-theme.el)


(load "~/.emacs.d/color-theme-molokai.el")
(color-theme-molokai)



;(load "~/emacs.d/emacs-ide.el")

;;
;; include gnuserv for integration with eclipse
;;
;(require 'gnuserv-compat)
;(require 'gnuserv)
;(gnuserv-start)
;; if XEmacs gnuserv binary gets in the way:
;; (setq server-program "/opt/emacs/gnuserv/default/gnuserv")
;(setq gnuserv-frame (selected-frame))


;;--------------------------------------------------------------------
;; Lines enabling gnuplot-mode

;; move the files gnuplot.el to someplace in your lisp load-path or
;; use a line like
;;  (setq load-path (append (list "/path/to/gnuplot") load-path))

;; these lines enable the use of gnuplot mode
  (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; this line automatically causes all files with the .gp extension to
;; be loaded into gnuplot mode
  (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; This line binds the function-9 key so that it opens a buffer into
;; gnuplot mode 
  (global-set-key [(f9)] 'gnuplot-make-buffer)

;; end of line for gnuplot-mode
;;--------------------------------------------------------------------


;;;;;;
;;;
;;; Initialize buffers
;;;

;(find-file ".")
;(find-file "co/core")
;(split-window-vertically)
;(other-window 1)
;(shell)
;(other-window 1)
;;(find-name-dired "src" "sdn")
;(find-file "src/java/com/sdn")
;(find-file "../../../test/unit/com/sdn")
;(switch-to-buffer "sdn")

(find-file "~")

(display-time)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-basic-offset 3)
 '(case-fold-search t)
 '(delete-selection-mode nil nil (delsel))
 '(find-grep-options "-q -i")
 '(indent-tabs-mode nil)
 '(max-lisp-eval-depth 8192)
 '(nxhtml-autoload-web nil t)
 '(scroll-bar-mode (quote right))
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 33) (border-width . 0) (menu-bar-lines . 0) (unsplittable . t))))
 '(speedbar-mode-specific-contents-flag t)
 '(speedbar-sort-tags t)
 '(tab-width 3)
 '(tempo-interactive t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mode-line ((t (:inverse-video nil :foreground "gray10" :background "gainsboro")))))


;; track the directory
(setq-default dirtrack-list '("^[^@]*@\\([^:]*:[^$].*\\)\\$" 1))
(add-hook 'dirtrack-directory-change-hook
          (lambda ()
            (let ((base-buffer-name (concat "shell-" default-directory "-shell"))
                  (i 1)
                  (full-buffer-name base-buffer-name))
              (while (get-buffer full-buffer-name)
                (setq i (1+ i))
                (setq full-buffer-name (concat base-buffer-name "<" (number-to-string i) ">")))
              (rename-buffer full-buffer-name))))
(add-hook 'shell-mode-hook
          (lambda ()
            (shell-dirtrack-mode -1)
            (insert "export PS1=\"cybermat/:\\w$ \"")
            (comint-send-input)
            (dirtrack-mode 1)
            ))
