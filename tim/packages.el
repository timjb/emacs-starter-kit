(add-to-list 'package-archives '("josh" . "http://josh.github.com/elpa/") t)

(defvar my-packages (list 'coffee-mode
                          'haskell-mode
                          'slime
                          'color-theme
                          'yasnippet-bundle
                          ;;'color-theme-solarized
                          'relax)
  "Packages that I need.")

(defun install-my-packages ()
  "Install all the packages that I need."
  (interactive)
  (dolist (package my-packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

(when (esk-online?) ;; esk = emacs-starter-kit
  (unless package-archive-contents (package-refresh-contents))
  (install-my-packages))
