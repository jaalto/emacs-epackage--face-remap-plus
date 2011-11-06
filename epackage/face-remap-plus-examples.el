;; face-remap-plus-examples.el

(error "face-remap-plus-examples.el is not a config file. Study the examples.")

;; From http://www.emacswiki.org/emacs/GlobalTextScaleMode
;; NOTE: The sollowing will override standard Emacs key bindings
;; M-0 = digit-argument
;; M-- = negative-argument
;; M-+ = <undefined>

(define-globalized-minor-mode
  my-face-remap-global-text-scale-mode
  text-scale-mode
  (lambda () (text-scale-mode 1)))

(defun my-global-text-scale-adjust (inc) (interactive)
  (text-scale-set 1)
  (kill-local-variable 'text-scale-mode-amount)
  (setq-default text-scale-mode-amount (+ text-scale-mode-amount inc))
  (my-global-text-scale-mode 1))

(global-set-key (kbd "M-0")
		(lambda ()
		  (interactive)
		  (my-global-text-scale-adjust (- text-scale-mode-amount))
		  (my-global-text-scale-mode -1)))

(global-set-key (kbd "M-+")
		(lambda ()
		  (interactive)
		  (my-global-text-scale-adjust 1)))

(global-set-key (kbd "M--")
		(lambda ()
		  (interactive)
		  (my-global-text-scale-adjust -1)))

;; End of file
