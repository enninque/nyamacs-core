;;; nyamacs-system.el --- 
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

(defun <system>mac-p ()
  "Return t if systeme is mac."
  (eq system-type 'darwin))

(defun <system>linux-p ()
  "Return t if system is linux."
  (eq system-type 'gnu/linux))

(defun <system>windows-p ()
  "Return t if system is windows."
  (eq system-type 'windows-nt))

(defun <system>user-login ()
  "Return user login."
  (getenv
   (if (<system>windows-p) "USERNAME" "USER")))

(defun <system>user-home ()
  "Return user home path."
  (getenv
   (if (<system>windows-p) "HOMEPATH" "HOME")))

(defun <system>getenv (env-variable &optional default-value)
  "Return environment variable value of ENV-VARIABLE.
If it's nil return DEFAULT-VALUE."
  (if (stringp env-variable)
      (or (getenv env-variable)
          default-value
          (error (format "Environment variable %s was not found"
                         env-variable)))
    (error "Can't get value of non-string key from environment")))

(provide 'nyamacs-system)
;;; nyamacs-system.el ends here
