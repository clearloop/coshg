;; new-if

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else then-clause)))
