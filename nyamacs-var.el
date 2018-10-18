;;; nyamacs-var.el --- 
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

(require 'nyamacs-list)

(defmacro <var>ensure-local (&rest args)
  "Ensure that VAR will be local variable with VALUE"
  `(cl-loop for (var value) in ',args
            do
            (if (local-variable-p var)
                (set var (eval value))
              (set (make-local-variable var) (eval value)))))

(defmacro <var>set (&optional docstring &rest clauses)
  "Set variables macro. Expands to setq."
  (declare (doc-string 1) (indent 0))

  (cond
   ((and (null docstring)
         (null clauses))
    nil)
   
   ((and (stringp docstring)
         (<list>{se}? clauses))
    `(setq ,@(cl-loop for (name exp) in clauses
                      collect name
                      collect exp)))

   ((<list>{se}? (cons docstring clauses))
    `(setq ,@(cl-loop for (name exp) in (cons docstring clauses)
                      collect name
                      collect exp)))

   (t (error "Incorrect usage of <var>set"))))

(defmacro <var>set-default (&optional docstring &rest clauses)
  "Set variables macro. Expands to setq."
  (declare (doc-string 1) (indent 0))

  (cond
   ((and (null docstring)
         (null clauses))
    nil)

   ((and (stringp docstring)
         (<list>{se}? clauses))
    `(setq-default ,@(cl-loop for (name exp) in clauses
                              collect name
                              collect exp)))

   ((<list>{se}? (cons docstring clauses))
    `(setq-default ,@(cl-loop for (name exp) in (cons docstring clauses)
                              collect name
                              collect exp)))

   (t (error "Incorrect usage of <var>set-default"))))

(defmacro <var>custom (&optional docstring &rest clauses)
  "Set variables macro. Expands to setq."
  (declare (doc-string 1) (indent 0))

  (cond
   ((and (null docstring)
         (null clauses))
    nil)

   ((and (stringp docstring)
         (<list>{se}? clauses))
    `(custom-set-variables ,@(cl-loop for (name exp) in clauses
                                      collect ``(,',name ,,exp))))

   ((<list>{se}? (cons docstring clauses))
    `(custom-set-variables ,@(cl-loop for (name exp) in (cons docstring clauses)
                                      collect ``(,',name ,,exp))))

   (t (error "Incorrect usage of <var>set-default"))))

(provide 'nyamacs-var)
;;; nyamacs-var.el ends here
