;;; nyamacs-core.el --- 
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
(require 'cl-macs)

;; TODO:
;; implement currying?
;; implement clojure-like ->

;; define
(defmacro ~defm (&rest forms)
  (declare (indent 2))
  
  `(cl-defmacro ,@forms))
  
(defmacro ~defn (&rest forms)
  (declare (indent 2))
  
  `(cl-defun ,@forms))

(defmacro ~defv (name &optional value docstring)
  "Define new variable."
  (declare (indent 2))

  `(defvar ,name ,value ,docstring))

(defmacro ~defc (name &optional value docstring)
  "Define new variable."
  (declare (indent 2))

  `(defconst ,name ,value ,docstring))

(defmacro ~defa (from to &optional docstring)
  "Define new variable."
  (declare (indent 2))

  (if (stringp docstring)
      `(defalias ',from ',to ,docstring)
    `(defalias ',from ',to)))

;; require
(defun ~require--extract-symbol-from-list (arg)
  ""
  (unless (eq (car arg)
              'quote)
    (error ""))

  (cadr arg))

(defun ~require--extract-symbol (arg)
  ""
  (if (listp arg)
      (~require--extract-symbol-from-list arg)
    arg))

(defmacro ~require (&rest args)
  ""
  (let ((symbols (cl-mapcar #'~require--extract-symbol
                            args)))
    `(progn
       ,@(cl-loop for symbol in symbols
                  collect `(require ',symbol)))))

;; set
(defmacro ~set (&rest forms)
  ""
  `(setq
    ,@(cl-loop for (variable-symbol variable-expression) in forms
               collect variable-symbol
               collect variable-expression)))

(defmacro ~do (&rest forms)
  ""
  (declare (indent 0))

  `(progn
     ,@forms))

;; predicates
(~defa symbol? symbolp)
(~defa string? stringp)
(~defa list? listp)

(provide 'nyamacs-core)
;;; nyamacs-core.el ends here
