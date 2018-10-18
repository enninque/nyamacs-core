;;; nyamacs-buffer.el --- 
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

(require 'nyamacs-core)

(defmacro <buffer>{with}all (varname &rest forms)
  "Creates binding of buffer list to VARNAME and executes FORMS."
  (declare (indent 1))
  
  `(let ((,varname (buffer-list)))
     ,@forms))

(defun <buffer>{kill}current ()
  "Kill current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(defun <buffer>{kill}by-major-mode (mode)
  "Kill all buffer by major mode MODE."
  (mapc (lambda (buffer)
          (when (eq mode
                    (buffer-local-value 'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

(cl-macrolet ((<buffer>{make}mover (to direction named as name)
                (let ((direction direction)
                      (name      name))
                  `(defun ,(intern (format "<buffer>{move}%s"
                                           (symbol-name name))) ()
                     "Swap current buffer with the left buffer."
                     (interactive)
                     
                     (let* ((other-window    (window-in-direction ',direction))
                            (other-buffer    (window-buffer other-window))
                            (current-buffer  (current-buffer))
                            (current-window  (get-buffer-window current-buffer)))
                       (when other-window
                         (set-window-buffer other-window
                                            current-buffer)
                         (set-window-buffer current-window
                                            other-buffer)
                         (select-window other-window)))))))

  (<buffer>{make}mover to left  named as left)
  (<buffer>{make}mover to right named as right)
  (<buffer>{make}mover to above named as up)
  (<buffer>{make}mover to below named as down)
  
  nil)

(defun <buffer>exists? (mode)
  "Return t if any buffer with MODE exists."
  (cl-reduce (lambda (a b)
               (or a b))
             (mapcar (lambda (buffer)
                       (eq mode
                           (buffer-local-value 'major-mode buffer)))
                     (buffer-list))))

(defun <buffer>unexists? (mode)
  "Return t if any buffer with MODE exists."
  (not (<buffer>exists-p mode)))

(defun <buffer>check-modes (&rest mode-list)
  "Return t if current buffer is one of modes in MODE-LIST."
  (cl-reduce (lambda (val mode)
               (or val
                   (eq major-mode
                       mode)))
             mode-list
             :initial-value nil))

(defun <buffer>save-function (&optional func)
  "Set/get buffer save function."
  (if (functionp func)
      (set (make-local-variable '--func-buffer-save-function) func)
    --func-buffer-save-function))

(defun <buffer>invoke-save-function ()
  "Invokes buffer save function."
  (interactive)
  (if (and (boundp '--func-buffer-save-function)
           (functionp --func-buffer-save-function))
      (funcall --func-buffer-save-function)
    (message "No internal save functions")))

(defun <buffer>copy ()
  "Yank buffer contents."
  (interactive)
  
  (kill-ring-save (point-min)
                  (point-max)))

(defun <buffer>replace ()
  "Yank buffer contents."
  (interactive)

  (erase-buffer)
  (yank))

(provide 'nyamacs-buffer)
;;; nyamacs-buffer.el ends here
