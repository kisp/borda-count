;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(in-package :asdf-user)

(defsystem :borda-count-test
  :name "borda-count-test"
  :description "Tests for borda-count"
  :components ((:module "test"
                :components ((:file "package")
                             (:file "test" :depends-on ("package")))))
  :depends-on (:borda-count :myam :alexandria))

(defmethod perform ((op test-op)
                    (system (eql (find-system :borda-count-test))))
  (perform op (find-system :borda-count)))
