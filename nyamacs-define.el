;;; nyamacs-define.el --- 
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

(require 'cl-macs)
(require 'nyamacs-core)

(~defm <define>init (&rest body)
  "Create new init function."
  (declare (indent 0))

  `(defun init ()
     ,@body))

(~defm <define>executer (name &rest args)
  "Defines a function, that should execute current buffer."
  (declare (indent 1))
  
  (let* ((executer-name (intern (format "<%s>{execute}"
                                        name)))
         (args          args)
         (docstring     (format "Execute current `%s' buffer." name))
         (body          args))
    `(defun ,executer-name ()
       ,docstring
       (interactive)

       ,@body)))

(~defm <define>activator (name &rest args)
  "Defines a function, that activates certain mode."
  (declare (indent 1))
  
  (let* ((activator-name (intern (format "<%s>{activate}"
                                         name)))
         (activator-docstring (format "Activate `%s'."
                                      name))
         (mode-name (intern (format "%s-mode"
                                    (symbol-name name))))
         (activator-body (if (> (length args)
                                0)
                             args
                           `((,mode-name +1)))))
    `(defun ,activator-name ()
       ,activator-docstring
       (interactive)
       ,@activator-body)))

(~defm <define>toggler (name &rest args)
  "Defines a function, that toggles certain mode."
  (declare (indent 1))
  
  (let* ((toggler-name (intern (format "<%s>{toggle}"
                                       name)))
         (toggler-docstring (format "Toggle `%s'."
                                    name))
         (mode-name (intern (format "%s-mode"
                                    (symbol-name name))))
         (toggler-body (if (> (length args)
                              0)
                           args
                         `((,mode-name (if ,mode-name
                                           -1
                                         +1))))))
    `(defun ,toggler-name ()
       ,toggler-docstring
       (interactive)
       ,@toggler-body)))

(~defm <define>setuper (name &rest forms)
  (declare (indent 1))

  (let ((setuper-name (intern (format "<%s>{setup}"
                                      (symbol-name name)))) 
        (docstring    (format "Setup `%s'."
                              (symbol-name name)))) 
    `(defun ,setuper-name ()
       ,docstring
       ,@forms)))

(~defa 造init      <define>init)
(~defa 造executer  <define>executer)
(~defa 造activator <define>activator)
(~defa 造toggler   <define>toggler)
(~defa 造setuper   <define>setuper)

(provide 'nyamacs-define)
;;; nyamacs-define.el ends here
