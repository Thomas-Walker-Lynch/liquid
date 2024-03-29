#|
  Copyright (C) 2014 Reasoning Technology  All Rights Reserved.
  COMPANY CONFIDENTIAL Reaosning Technology
  author: thomas w. lynch
  
  2014-10-01 This file is being released under the GNU Lesser General Public License. 
  Please see the file ../doc/lpgl-3.0.txt for a copy of the license.

|#

#lang racket

;;--------------------------------------------------------------------------------
;; uses these libraries
;;    
  (require "test-lib.rkt")

;;--------------------------------------------------------------------------------
;; arith operators
;;
  (define (≠ . args) (not (apply = args)))
  (define ≥ >=)
  (define ≤ <=)
  (define (++ n) (+ n 1))
  (define (-- n) (- n 1))

  (define (++! n) (begin (set! n (+ n 1)) n))
  (define (--! n) (begin (set! n (- n 1)) n))


  ;; and can not be used with apply,  and-form can be
  ;; and-form does not short circuit
  ;;
    (define (and-form . args) (and-form* args))
    (define (and-form* arg-list) (andmap identity arg-list))

    (define (or-form . args) (or-form* args))
    (define (or-form* arg-list) (ormap identity arg-list))

    (define (and-form-test-0)
      (and
        (and-form #t #t #t)
        (not (and-form #t #f #t))))
    (test-hook and-form-test-0)


;;--------------------------------------------------------------------------------
;; provides the following
;;    

  ;; functions
  ;;
    (provide-with-trace "arith-lib" ;; this context continues to the bottom of the page

     ≠
     ≥
     ≤
     ++
     --
     ++!
     --!

    and-form
    and-form*

    or-form 
    or-form*

          
      )
