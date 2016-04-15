#lang racket

(define MINWORDLENGTH 3)
(define MAXWORDLENGTH 8)

;; Loads list of words in from file, will eventually excludes words outside of length limits
(define (lengthcheck str)
  (if (or (< (string-length str) MINWORDLENGTH) (> (string-length str) MAXWORDLENGTH))
      #f
      #t))
;;(define dictionary (filter lengthcheck (map symbol->string (file->list (string->path "dictionary.txt")))))
(define dictionary (file->list (string->path "dictionary.txt")))

;; Basically a constructor for game, takes one arg: difficulty
(define (new-game difficulty)
  (cond ((eq? difficulty 'easy) (make-game 'easy))
        ((eq? difficulty 'hard) (make-game 'hard))
        (else (make-game 'normal (symbol->string (car (list-tail dictionary (random (length dictionary)))))))))


;; Game object, use constructor new-game
(define (make-game difficulty wordlist)
  (define guesslist '())
  (define word-in-progress (make-string (string-length wordlist) #\*))
  (define wrong-count 0)
  (define gameover #f)
  (println word-in-progress)
  ;; Revealing letters that are guessed
  (define (reveal key char count)
    (cond ((= count (string-length word-in-progress)) #t) 
      ((equal? (string-ref key count) char) (begin (string-set! word-in-progress count char) (reveal key char (+ 1 count))))
      (else (reveal key char (+ 1 count)))))
  ;; Main game behavior
  (define (guess char) (if gameover (println "The game is over...")
                           (cond ((eq? difficulty 'easy) (println "Not yet implemented")) ;easy implementation
                             ((eq? difficulty 'hard) (println "Not yet implemented")) ;hard implementation
                             (else (begin (set! guesslist (append guesslist '(char))) ;normal implementation
                                          (if (string-contains? wordlist char)
                                              (begin (println "play success sound")
                                                     (println "Correct guess!")
                                                     (reveal wordlist (string-ref char 0) 0)
                                                     (println word-in-progress)) ;update word-in-progress here, then print it
                                              (begin (println "play failure sound")
                                                     (set! wrong-count (+ wrong-count 1))
                                                     (when (> wrong-count 6) (set! gameover #t)))))))))
  (define (dispatch msg)
    (cond ((eq? msg 'guess) guess)
          (else (error "Invalid dispatch request" msg))))
  dispatch)

;; Starts a new game on normal difficulty, makes testing faster
(define game (new-game 'normal))

;; Wrapper for guessing function, makes testing faster
(define (guess char) ((game 'guess) char))
