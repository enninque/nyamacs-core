;;; nyamacs-keyboard.el --- 
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

(defconst <keymap>function-bindings-to-forget
  (list "C-@"
        "<C-M-S-kp-0>"
        "<C-M-S-kp-1>"
        "<C-M-S-kp-2>"
        "<C-M-S-kp-3>"
        "<C-M-S-kp-4>"
        "<C-M-S-kp-5>"
        "<C-M-S-kp-6>"
        "<C-M-S-kp-7>"
        "<C-M-S-kp-8>"
        "<C-M-S-kp-9>"
        "<C-M-S-kp-add>"
        "<C-M-S-kp-begin>"
        "<C-M-S-kp-decimal>"
        "<C-M-S-kp-delete>"
        "<C-M-S-kp-divide>"
        "<C-M-S-kp-down>"
        "<C-M-S-kp-end>"
        "<C-M-S-kp-enter>"
        "<C-M-S-kp-home>"
        "<C-M-S-kp-insert>"
        "<C-M-S-kp-left>"
        "<C-M-S-kp-multiply>"
        "<C-M-S-kp-next>"
        "<C-M-S-kp-prior>"
        "<C-M-S-kp-right>"
        "<C-M-S-kp-subtract>"
        "<C-M-S-kp-up>"
        "<C-M-kp-0>"
        "<C-M-kp-1>"
        "<C-M-kp-2>"
        "<C-M-kp-3>"
        "<C-M-kp-4>"
        "<C-M-kp-5>"
        "<C-M-kp-6>"
        "<C-M-kp-7>"
        "<C-M-kp-8>"
        "<C-M-kp-9>"
        "<C-M-kp-add>"
        "<C-M-kp-begin>"
        "<C-M-kp-decimal>"
        "<C-M-kp-delete>"
        "<C-M-kp-divide>"
        "<C-M-kp-down>"
        "<C-M-kp-end>"
        "<C-M-kp-enter>"
        "<C-M-kp-home>"
        "<C-M-kp-insert>"
        "<C-M-kp-left>"
        "<C-M-kp-multiply>"
        "<C-M-kp-next>"
        "<C-M-kp-prior>"
        "<C-M-kp-right>"
        "<C-M-kp-subtract>"
        "<C-M-kp-up>"
        "<C-S-kp-0>"
        "<C-S-kp-1>"
        "<C-S-kp-2>"
        "<C-S-kp-3>"
        "<C-S-kp-4>"
        "<C-S-kp-5>"
        "<C-S-kp-6>"
        "<C-S-kp-7>"
        "<C-S-kp-8>"
        "<C-S-kp-9>"
        "<C-S-kp-add>"
        "<C-S-kp-begin>"
        "<C-S-kp-decimal>"
        "<C-S-kp-delete>"
        "<C-S-kp-divide>"
        "<C-S-kp-down>"
        "<C-S-kp-end>"
        "<C-S-kp-enter>"
        "<C-S-kp-home>"
        "<C-S-kp-insert>"
        "<C-S-kp-left>"
        "<C-S-kp-multiply>"
        "<C-S-kp-next>"
        "<C-S-kp-prior>"
        "<C-S-kp-right>"
        "<C-S-kp-subtract>"
        "<C-S-kp-up>"
        "<C-kp-0>"
        "<C-kp-1>"
        "<C-kp-2>"
        "<C-kp-3>"
        "<C-kp-4>"
        "<C-kp-5>"
        "<C-kp-6>"
        "<C-kp-7>"
        "<C-kp-8>"
        "<C-kp-9>"
        "<C-kp-add>"
        "<C-kp-begin>"
        "<C-kp-decimal>"
        "<C-kp-delete>"
        "<C-kp-divide>"
        "<C-kp-down>"
        "<C-kp-end>"
        "<C-kp-enter>"
        "<C-kp-home>"
        "<C-kp-insert>"
        "<C-kp-left>"
        "<C-kp-multiply>"
        "<C-kp-next>"
        "<C-kp-prior>"
        "<C-kp-right>"
        "<C-kp-subtract>"
        "<C-kp-up>"
        "<M-S-kp-0>"
        "<M-S-kp-1>"
        "<M-S-kp-2>"
        "<M-S-kp-3>"
        "<M-S-kp-4>"
        "<M-S-kp-5>"
        "<M-S-kp-6>"
        "<M-S-kp-7>"
        "<M-S-kp-8>"
        "<M-S-kp-9>"
        "<M-S-kp-add>"
        "<M-S-kp-begin>"
        "<M-S-kp-decimal>"
        "<M-S-kp-delete>"
        "<M-S-kp-divide>"
        "<M-S-kp-down>"
        "<M-S-kp-end>"
        "<M-S-kp-enter>"
        "<M-S-kp-home>"
        "<M-S-kp-insert>"
        "<M-S-kp-left>"
        "<M-S-kp-multiply>"
        "<M-S-kp-next>"
        "<M-S-kp-prior>"
        "<M-S-kp-right>"
        "<M-S-kp-subtract>"
        "<M-S-kp-up>"
        "<M-kp-0>"
        "<M-kp-1>"
        "<M-kp-2>"
        "<M-kp-3>"
        "<M-kp-4>"
        "<M-kp-5>"
        "<M-kp-6>"
        "<M-kp-7>"
        "<M-kp-8>"
        "<M-kp-9>"
        "<M-kp-add>"
        "<M-kp-begin>"
        "<M-kp-decimal>"
        "<M-kp-delete>"
        "<M-kp-divide>"
        "<M-kp-down>"
        "<M-kp-end>"
        "<M-kp-enter>"
        "<M-kp-home>"
        "<M-kp-insert>"
        "<M-kp-left>"
        "<M-kp-multiply>"
        "<M-kp-next>"
        "<M-kp-prior>"
        "<M-kp-right>"
        "<M-kp-subtract>"
        "<M-kp-up>"
        "<S-kp-0>"
        "<S-kp-1>"
        "<S-kp-2>"
        "<S-kp-3>"
        "<S-kp-4>"
        "<S-kp-5>"
        "<S-kp-6>"
        "<S-kp-7>"
        "<S-kp-8>"
        "<S-kp-9>"
        "<S-kp-add>"
        "<S-kp-begin>"
        "<S-kp-decimal>"
        "<S-kp-delete>"
        "<S-kp-divide>"
        "<S-kp-down>"
        "<S-kp-end>"
        "<S-kp-enter>"
        "<S-kp-home>"
        "<S-kp-insert>"
        "<S-kp-left>"
        "<S-kp-multiply>"
        "<S-kp-next>"
        "<S-kp-prior>"
        "<S-kp-right>"
        "<S-kp-subtract>"
        "<S-kp-up>"
        "<kp-0>"
        "<kp-1>"
        "<kp-2>"
        "<kp-3>"
        "<kp-4>"
        "<kp-5>"
        "<kp-6>"
        "<kp-7>"
        "<kp-8>"
        "<kp-9>"
        "<kp-add>"
        "<kp-begin>"
        "<kp-decimal>"
        "<kp-delete>"
        "<kp-divide>"
        "<kp-down>"
        "<kp-end>"
        "<kp-enter>"
        "<kp-equal>"
        "<kp-home>"
        "<kp-insert>"
        "<kp-left>"
        "<kp-multiply>"
        "<kp-next>"
        "<kp-prior>"
        "<kp-right>"
        "<kp-separator>"
        "<kp-space>"
        "<kp-subtract>"
        "<kp-tab>"
        "<kp-up>"
        "<left-fringe>"
        "<linefeed>"
        "<right-fringe>"


        "<right-fringe> <mouse-1>"
        "<right-fringe> <mouse-2>"
        "<right-fringe> <mouse-3>"

        "<left-fringe> <mouse-1>"
        "<left-fringe> <mouse-2>"
        "<left-fringe> <mouse-3>"

        "C-x @"

        "C-x @ S"
        "C-x @ a"
        "C-x @ c"
        "C-x @ h"
        "C-x @ m"
        "C-x @ s"

        ;; "C-x"
        ;; "<return>"
        ;; "<tab>"
        ;; "<S-tab>"
        ;; "<backspace>"
        ;; "<clear>"
        ;; "<delete>"
        ;; "<escape>"
        ))

(defconst <keymap>format-strings 
  (list "C-%s"
        "H-%s"
        "A-%s"
        "M-%s"

        "C-H-%s"
        "A-C-%s"
        "C-M-%s"
        "A-H-%s"
        "H-M-%s"
        "A-M-%s"

        "A-C-H-%s"
        "C-H-M-%s"
        "A-H-M-%s"
        "A-C-M-%s"

        "A-C-H-M-%s"))

(defconst <keymap>key-to-forget 
  (list "q" "w" "e" "r" "t" "y" "u" "i" "o" "p"
        "a" "s" "d" "f" "g" "h" "j" "k" "l"
        "z" "x" "c" "v" "b"  "n" "m"

        "Q" "W" "E" "R" "T" "Y" "U" "I" "O" "P"
        "A" "S" "D" "F" "G" "H" "J" "K" "L"
        "Z" "X" "C" "V" "B"  "N" "M"

        "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "="
        "`" "~" "!" "@" "#" "$" "%" "^" "&" "*" "(" ")" "_" "+"
        ";" ":" "[" "]" "{" "}" "," "<" "." ">" "/" "?" "'"))

(defmacro <keymap>bind (map arg func)
  (when (null map)
    (error "map is nil: %s" map))

  (when (null arg)
    (error "arg is nil: %s" arg))

  (cond
   ((listp arg)
    `(progn
       ,@(cl-loop for elem in arg
                  collect
                  (list 'define-key
                        map
                        (kbd elem)
                        func))))

   ((vectorp arg)
    `(define-key ,map ,arg ,func))

   ((stringp arg)
    `(define-key ,map ,(kbd arg) ,func))

   (t (error "%s is not a list or string" arg))))

(defun <keymap>quoted? (candidate)
  (or (eq (car candidate)
          'function)
      (eq (car candidate)
          'quote)))

(defun <keymap>lambda? (candidate)
  (eq (car candidate)
      'lambda))

(defun <keymap>evaluable? (candidate)
  (or (functionp (car candidate))
      (special-form-p (car candidate))))

(defun <keymap>macro? (candidate)
  (macrop (car candidate)))

(defun <keymap>$create-function-from-list (candidate)
  (cond
   ((<keymap>quoted? candidate)
    `(function ,(nth 1 candidate)))

   ((<keymap>lambda? candidate)
    candidate)

   ((<keymap>evaluable? candidate)
    `(lambda ()
       (interactive)
       ,candidate))

   ((<keymap>macro? candidate)
    `(lambda ()
       (interactive)
       ,(macroexpand-all candidate)))))

(defun <keymap>create-function (candidate)
  (cond
   ((null candidate)
    nil)

   ((symbolp candidate)
    (let ((--symbol-value (symbol-value candidate)))
      (cond
       ((keymapp --symbol-value)
        candidate)

       (t candidate))))

   ((listp candidate)
    (<keymap>$create-function-from-list candidate))

   (t (error "Unexpected arg: %s" candidate))))

(defmacro <keymap>-create-bindings (keymap args)
  (declare (indent 1))

  (unless (keymapp (symbol-value keymap))
    (error "%s is not a valid keymap" (symbol-value keymap)))

  `(progn
     ,@(cl-loop for (kbd func) in args
                collect
                (list '<keymap>bind
                      keymap
                      kbd
                      (<keymap>create-function func)))))

(defmacro <keymap>{bind}digits (map func)
  "Bind FUNC to digits in MAP."
  `(<keymap>bind ,map
                 ("1" "2" "3" "4" "5" "6" "7" "8" "9" "0")
                 ,func))

(defmacro <keymap>{create} (keymap-name &rest args)
  (declare (indent 1))

  `(progn
     (setq ,keymap-name (make-sparse-keymap))
     (<keymap>-create-bindings ,keymap-name ,args)))

(defmacro <keymap>{define} (keymap-name &rest args)
  (declare (indent 1))

  `(<keymap>-create-bindings ,keymap-name ,args))

(defmacro <keymap>{define}global (&rest args)
  (declare (indent 0))

  `(<keymap>-create-bindings global-map ,args))

(defmacro <keymap>{define}local (&rest args)
  (declare (indent 0))

  `(progn
     ,@(cl-loop for (kbd func) in args
                collect
                (list 'local-set-key
                      (list 'kbd kbd)
                      (<keymap>create-function func)))))

(defmacro <keymap>{save} (&rest keymaps)
  (declare (indent 0))

  (dolist (keymap keymaps)
    (unless (keymapp (symbol-value keymap))
      (error "%s is not a keymap" (symbol-value keymap))))


  (let ((pattern "--func-saved-keymap-%s"))
    `(setq
      ,@(cl-loop for keymap in keymaps
                 collect (intern (format pattern
                                         (symbol-name keymap)))
                 collect keymap))))

(defmacro <keymap>{save}{create} (keymap &rest args)
  "Saves KEYMAP and sets new keymap."
  (declare (indent 1))

  `(progn
     (<keymap>{save} ,keymap)
     (<keymap>{create} ,keymap
                       ,@args)))

(defun <keymap>{clear}function-map ()
  "Removes bindings from function map."
  (cl-loop for binding in <keymap>function-bindings-to-forget
           do
           (define-key function-key-map
             (kbd binding) nil)))

(defun <keymap>{clear}global-map ()
  "Removes bindings from global map."

  (dolist (k '("return" "tab" "escape"))
    (dolist (format-string <keymap>format-strings)
      (global-unset-key (kbd (format (concat "<"
                                             format-string
                                             ">")
                                     k)))))

  (dolist (k <keymap>key-to-forget)
    (dolist (format-string <keymap>format-strings)
      (global-unset-key (kbd (format format-string
                                     k)))))

  (dolist (k '("RET" "TAB" "ESC"))
    (global-unset-key (kbd k))
    (global-unset-key (kbd (concat "M-" k))))

  (dolist (key (list [up]
                     [right]
                     [down]
                     [left]))
    (global-unset-key key)))


(provide 'nyamacs-keymap)
;;; nyamacs-keyboard.el ends here
