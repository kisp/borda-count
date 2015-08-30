;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(in-package :borda-count)

(defun votes-valid-p (votes)
  (if (null votes)
      t
      (and (every #'setp votes)
           (destructuring-bind (first . rest) votes
             (every (curry #'set-equal first) rest)))))

(defun validate-votes (votes)
  (unless (votes-valid-p votes)
    (error "votes are not valid")))

(defun borda-count (votes)
  (validate-votes votes)
  (let ((hash (make-hash-table)))
    (dolist (vote votes)
      (loop for x in vote
            for i downfrom (length vote)
            do (incf (gethash x hash 0) i)))
    (sort (hash-table-alist hash) #'> :key #'cdr)))
