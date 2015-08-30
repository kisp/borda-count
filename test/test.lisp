;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:utf-8 -*-

(in-package :borda-count-test)

(defsuite* :borda-count-test)

(deftest borda-count.1
  (is (equal '((a . 3) (b . 2) (c . 1))
             (borda-count '((a b c))))))

(deftest borda-count.2
  (is (equal '((a . 2) (b . 1))
             (borda-count '((a b))))))

(deftest borda-count.3
  (is (equal '((a . 6) (b . 4) (c . 2))
             (borda-count '((a b c)
                            (a b c))))))

(deftest borda-count.4
  (is (equal '((e . 41) (f . 38) (a . 30) (c . 23) (d . 22) (b . 14))
             (borda-count '((a e b c d f)
                            (f d e c b a)
                            (f a e d c b)
                            (e f a c d b)
                            (f e d a c b)
                            (a e f c d b)
                            (e f c d b a)
                            (e f a c b d))))))

(deftest borda-count.5
  (signals error (borda-count '((a b a)))))

(deftest borda-count.6
  (signals error (borda-count '((a b c)
                                (a b c a)))))

(deftest borda-count.7
  (signals error (borda-count '((a b c)
                                (x y z)))))
