(set-frame-height (selected-frame) 40)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(global-font-lock-mode t nil (font-lock))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(transient-mark-mode t)
 '(truncate-lines nil)
 '(truncate-partial-width-windows t))
(setq cua-auto-tabify-rectangles nil)
(setq c-default-style "k&r")
(add-hook 'c-mode-hook (lambda () (c-toggle-auto-hungry-state 1)))
(transient-mark-mode t)
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(add-hook 'c++-mode-hook 'c-toggle-auto-hungry-state)
(setq c-hanging-braces-alist '((brace-list-open)(brace-entry-open)(substatement-open after)(block-close . c-snug-do-while)(extern-lang-open after)(inexpr-class-open after)(inexpr-class-close before)(defun-open after)))

(load-library "cperl-mode")
(add-to-list 'auto-mode-alist '("\\\\.[Pp][LlMm][Cc]?$" . cperl-mode))
(while (let ((orig (rassoc 'perl-mode auto-mode-alist)))
(if orig (setcdr orig 'cperl-mode))))
(while (let ((orig (rassoc 'perl-mode interpreter-mode-alist)))
(if orig (setcdr orig 'cperl-mode))))
(dolist (interpreter '("perl" "perl5" "miniperl" "pugs"))
(unless (assoc interpreter interpreter-mode-alist)
(add-to-list 'interpreter-mode-alist (cons interpreter 'cperl-mode))))

(defun perl-eval (beg end)
"Run selected region as Perl code"
(interactive "r")
(shell-command-on-region beg end "perl")
; feeds the region to perl on STDIN
)

(global-set-key "\M-\C-p" 'perl-eval)
(global-set-key (kbd "<f5>") 'perl-eval)

(defmacro mark-active ()
"Xemacs/emacs compatibility macro"
(if (boundp 'mark-active)
'mark-active
'(mark)))
(defun perltidy ( )
"Run perltidy on the current region or buffer."
(interactive)
; Inexplicably, save-excursion doesn't work here.
(let ((orig-point (point)))
(unless (mark-active) (mark-defun))
(shell-command-on-region (point) (mark) "perltidy -q" nil t)
(goto-char orig-point)))

(global-set-key "\M-\C-t" 'perltidy)
(global-set-key (kbd "C-<f5>") 'perltidy)

(defun cmd-eval (beg end)
"Run selected region as Cmd code"
(interactive "r")
(shell-command-on-region beg end "cmd")
; feeds the region to cmd on STDIN
)

(global-set-key (kbd "<f7>") 'cmd-eval)
(global-set-key (kbd "<f8>") 'mark-whole-buffer)
