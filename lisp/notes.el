(require 'cl-lib)

(defvar my-notes-directory (expand-file-name "~/notes/"))

(defun my-notes--file-for-title (title)
  (expand-file-name
   (concat (replace-regexp-in-string "/" "_" title) ".md")
   my-notes-directory))

(defun my-notes--title-at-point ()
  (save-excursion
    (let ((case-fold-search nil))
      (when (re-search-backward "\\[\\[" nil t)
        (let* ((start (point))
               (end (save-excursion
                      (when (re-search-forward "\\]\\]" nil t)
                        (point)))))
          (when (and end (> end start))
            (let ((raw (buffer-substring-no-properties start end)))
              (when (string-match "\\[\\[\\(.*\\)\\]\\]" raw)
                (string-trim (match-string 1 raw))))))))))

(defun my-notes-open-link ()
  "If point is on/near [[Title]], open ~/notes/Title.md (create if missing)."
  (interactive)
  (unless (file-directory-p my-notes-directory)
    (make-directory my-notes-directory t))
  (let* ((title (or (my-notes--title-at-point)
                     (read-string "Note title: ")))
         (file  (my-notes--file-for-title title)))
    (find-file file)))

(global-set-key (kbd "C-c n") #'my-notes-open-link)

(provide 'notes)
