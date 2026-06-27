;; Navigation
(global-set-key (kbd "C-c p") #'project-switch-project)
(global-set-key (kbd "C-c f") #'project-find-file)
(global-set-key (kbd "C-c g") #'consult-ripgrep)
(global-set-key (kbd "C-c s") #'consult-line)

(defun my-notes-open ()
  (interactive)
  (find-file (expand-file-name "index.md" "~/notes/")))

(global-set-key (kbd "C-c n") #'my-notes-open)

(global-set-key (kbd "C-c t") #'term)


(global-set-key (kbd "C-c e") #'dired)

;; EMMS Keybinds ;;
(with-eval-after-load 'emms
  (define-key emms-playlist-mode-map (kbd "p") 'emms-pause)
  (define-key emms-playlist-mode-map (kbd "n") 'emms-next)
  (define-key emms-playlist-mode-map (kbd "N") 'emms-previous)
  (define-key emms-playlist-mode-map (kbd "s") 'emms-stop)
  (define-key emms-playlist-mode-map (kbd "d") 'emms-playlist-mode-kill-track))

(with-eval-after-load 'emms-browser
  (define-key emms-browser-mode-map (kbd "RET") 'emms-browser-add-tracks))

(global-set-key (kbd "C-c m") 'emms-playlist-mode-go)

(with-eval-after-load 'elfeed
  (define-key elfeed-search-mode-map (kbd "v") 'my/elfeed-play-with-mpv)
  (define-key elfeed-search-mode-map (kbd "g") 'elfeed-update)
  (define-key elfeed-search-mode-map (kbd "q") 'quit-window))

(global-set-key (kbd "C-c w") 'elfeed)

(provide 'keybinds)
