;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(in-package :asdf-user)

(defsystem :borda-count
  :name "borda-count"
  :description "An implementation of Borda count in Common Lisp."
  :author "Kilian Sprotte <kilian.sprotte@gmail.com>"
  :version #.(with-open-file
                 (vers (merge-pathnames "version.lisp-expr" *load-truename*))
               (read vers))
  :components ((:static-file "version" :pathname #p"version.lisp-expr")
               (:file "package")
               (:file "borda-count" :depends-on ("package"))
               )
  :depends-on (:alexandria))

(defmethod perform ((op test-op)
                    (system (eql (find-system :borda-count))))
  (oos 'load-op :borda-count-test)
  (funcall (intern "RUN!" "MYAM") :borda-count-test))
