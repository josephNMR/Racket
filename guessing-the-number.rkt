#lang racket

(fprintf (current-output-port) "This program helps you guess a number from 1 - 100 by default. If you would like a new starting point for guessing,
use (start first second) to guess the number between the 'first' and 'second' variables. If your guessed number is 
higher, type (bigger). If smaller, type (smaller). 
Let's start guessing !!!")

(define lower 1)
(define upper 100)

;adds lower and upper values and returns the quotient by 2. Quotient is used instead of / to return whole numbers.
(define (guess)
  (quotient (+ lower upper) 2)) 

;sets upper to a new value from the return of max 
(define (smaller)
  (set! upper (max lower(sub1 (guess)))) ;max returns the higher value b/w (lower) and (sub1 (guess)) then sets to upper
  (guess)) ;(guess) is called again to show the current guess of the number

;sets lower to a new value from the return of min 
(define (bigger)
  (set! lower (min upper (add1 (guess)))) ;min returns the lower value b/w (upper) and (add1 (guess)) then sets to lower
  (guess))

;mutates the default values of lower and upper to first and second variable
(define (start first second) ;n & m mutates lower and upper using set!
  (set! lower (min first second))
  (set! upper (max first second))
  (guess))

#| <-- block commenting
;  <-- line commenting
#; <-- form commenting
(set! variable expression) - set! evaluates the expression then sets the variable the result of expression

max returns the maximum of variables provided

min returns the minimum of variables provided

sub1 (x) = x minus 1 || (- (x) 1)  

add1 (x) = x plus 1 || (+ (x) 1)
|#