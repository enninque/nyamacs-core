;;; nyamacs-misc.el --- 
;;
;; Author:  <enquer@sabayon.local>
;; Version: 0.1
;; URL: 
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;; .
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(defun <file>eval (path)
  "Eval file by PATH."
  (with-current-buffer (find-file-noselect path)
    (goto-char (point-min))
    (read (current-buffer))))

(defun <tramp>sudo-write (&optional filepath)
  (interactive)
  (let ((result-filepath (or filepath buffer-file-name)))
    (when result-filepath
      (write-file (concat "/sudo:root@localhost:" result-filepath)))))

(defun <filetype>register (mode &rest patterns)
  "Add new item in `auto-mode-alist'."
  (cl-loop for --pattern in patterns
           do
           (add-to-list 'auto-mode-alist `(,--pattern . ,mode))))

(defun <settings>show-trailing-whitespaces (&optional turn-on)
  "Show/disable trailing whitespaces in current buffer."
  (setq show-trailing-whitespace (or turn-on t)))

(provide 'nyamacs-misc)
;;; nyamacs-misc.el ends here
