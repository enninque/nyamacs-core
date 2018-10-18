;;; nyamacs-window.el ---  -*- lexical-binding: t -*-
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

(require 'cl-lib)

(require 'nyamacs-core)
(require 'nyamacs-buffer)

(defun <window>{kill}by-modes (&rest mode-list)
  "Delete all windows whose displayed buffer is one of mode-list."

  ;; TODO: Add minor modes?
  (<buffer>{with}all buffers
    (let* ((target-buffers (cl-remove-if-not (lambda (buffer)
                                               (and (get-buffer-window buffer)
                                                    (with-current-buffer buffer
                                                      (cl-member major-mode
                                                                 mode-list))))
                                             buffers))
           (windows-to-delete (cl-mapcar #'get-buffer-window
                                         target-buffers)))
      (cl-mapc #'delete-window
               windows-to-delete))))

(defmacro <window>{with}focused (varname &rest forms)
  "Create binding of the focused window to VARNAME and execute FORMS."
  (declare (indent 1))
  
  `(let ((,varname (selected-window)))
     ,@forms))

(cl-defmacro <window>{with}directed (direction varname &rest forms)
  ""
  (declare (indent 2))
  
  (let ((varname-sym varname))
    `(let ((,varname-sym (window-in-direction ,direction
                                              (selected-window))))
       (unless (null ,varname-sym)
         ,@forms))))

(cl-defmacro <window>{with}left (&rest args)
  ""
  (declare (indent 1))
  
  `(<window>{with}directed 'left ,@args))

(cl-defmacro <window>{with}down (&rest args)
  ""
  (declare (indent 1))
  
  `(<window>{with}directed 'below ,@args))

(cl-defmacro <window>{with}top (&rest args)
  ""
  (declare (indent 1))
  
  `(<window>{with}directed 'above ,@args))

(cl-defmacro <window>{with}right (&rest args)
  ""
  (declare (indent 1))
  
  `(<window>{with}directed 'right ,@args))

(defun <window>{shrink}horizontally ()
  ""
  (interactive)

  (<window>{with}right right-window
    (unless (null right-window)
      (shrink-window-horizontally 1))))

(defun <window>{shrink}vertically ()
  ""
  (interactive)

  (<window>{with}down below-window
    (unless (null below-window)
      (shrink-window 1))))

(defun <window>{enlarge}horizontally ()
  ""
  (interactive)

  (<window>{with}right right-window
    (unless (null right-window)
      (enlarge-window-horizontally 1))))

(defun <window>{enlarge}vertically ()
  ""
  (interactive)

  (<window>{with}down below-window
    (unless (null below-window)
      (enlarge-window 1))))

(~defa <window>{split}right     split-window-right)
(~defa <window>{split}down      split-window-below)

(~defa <window>{delete}current  delete-window)
(~defa <window>{delete}others   delete-other-windows)

(~defa <window>{balance}        balance-windows)

(provide 'nyamacs-window)
;;; nyamacs-window.el ends here
