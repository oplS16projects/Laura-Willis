#lang racket

;; Loads list of words in from file
(define dictionary (file->list (string->path "dictionary.txt")))

;; Basically a constructor for game, takes one arg: difficulty
(define (new-game difficulty)
  (cond ((eq? difficulty 'easy) (make-game 'easy))
        ((eq? difficulty 'hard) (make-game 'hard))
        (else (make-game 'normal (car (list-tail dictionary (random (length dictionary))))))))

;; Game object, use constructor new-game
(define (make-game difficulty wordlist)
  (define guesslist '())
  (define wrong-count 0)
  (define gameover #f)
  (define (guess char) (+ 1 1))
  (define (dispatch msg)
    (cond ((eq? msg 'guess) guess)
          (else (error "Invalid dispatch request" msg))))
  dispatch)