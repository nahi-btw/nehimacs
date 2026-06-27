(setq elfeed-search-title-max-width 100)
(setq elfeed-search-trailing-width 25)

;; Function to hand the entry's link off to mpv, which uses yt-dlp under the hood
(defun my/elfeed-play-with-mpv ()
  "Play the current elfeed entry's video in mpv via yt-dlp."
  (interactive)
  (let ((link (elfeed-entry-link (elfeed-search-selected :single))))
    (when link
      (message "Opening %s in mpv..." link)
      (start-process "elfeed-mpv" nil "mpv" "--ytdl-format=best" link))))

;; Catppuccin Mocha tweaks for the search buffer
(custom-set-faces
 '(elfeed-search-feed-face ((t (:foreground "#89b4fa"))))   ; blue
 '(elfeed-search-tag-face ((t (:foreground "#a6e3a1"))))    ; green
 '(elfeed-search-date-face ((t (:foreground "#9399b2")))))  ; overlay2

(provide 'my-yt-config)
