#lang racket

(require rsound)
(require lang/plt-pretty-big-text)
(require net/url)
(require racket/gui/base)

;; Global Definitions
(define MINWORDLENGTH 3)
(define MAXWORDLENGTH 8)
;(define WINSOUND (rs-read (string->path "win.wav")))
;(define LOSESOUND (rs-read (string->path "lose.wav")))
(define SUCCESS (rs-read (string->path "success.wav")))
(define FAILURE (rs-read (string->path "failure.wav")))
(define f (new frame% [label "Hang me, with sounds!"] [width 600] [height 600]))
(define bm (make-object bitmap% (get-pure-port (string->url "https://raw.githubusercontent.com/oplS16projects/Laura-Willis/master/Deck.png"))))

;; Loads the deck image into a 'canvas'
(define pos -55)
(define mycanvas%
  (class canvas%
    (super-new)
    (inherit get-dc)
         (define/override (on-paint)
            (let ([my-dc (get-dc)])
              (send my-dc draw-bitmap bm pos pos)))))

;;
;; IMPORTANT, below is code adding parts to the frame
;;
(define c (new mycanvas% [parent f]))

(define wiplabel (new message% [parent f] [label ""] ))
(define guesslabel (new message% [parent f] [label ""] ))
(define infolabel (new message% [parent f] [label "Type easy, normal, or hard to begin a new game."] ))

;; Event handler for text box
(define (event-handler t e) (define boxinput (send t get-value))
  (if (eqv? (send e get-event-type) 'text-field-enter)
      (begin (send t set-value "") (cond ((string-ci=? boxinput "easy") (println "starteasygame"))
                                         ((string-ci=? boxinput "normal") (set! game (new-game 'normal)))
                                         ((string-ci=? boxinput "hard") (println "starthardgame"))
                                         ((= 1 (string-length boxinput)) (guess boxinput))))
      #f))
;; Add a text field to the dialog
(define txt (new text-field% [parent f] [label "Please enter a letter:"] [callback event-handler]))


;; Loads list of words in from file, will eventually excludes words outside of length limits
(define (lengthcheck str)
  (if (or (< (string-length str) MINWORDLENGTH) (> (string-length str) MAXWORDLENGTH))
      #f
      #t))
;;(define dictionary (filter lengthcheck (map symbol->string (file->list (string->path "dictionary.txt")))))
(define dictionary (filter lengthcheck (map symbol->string (file->list (string->path "dictionary.txt")))))

;; Basically a constructor for game, takes one arg: difficulty
(define (new-game difficulty)
  (cond ((eq? difficulty 'easy) (make-game 'easy))
        ((eq? difficulty 'hard) (make-game 'hard))
        ('else (make-game 'normal (car (list-tail dictionary (random (length dictionary))))))))


;; Game object, use constructor new-game
(define (make-game difficulty wordlist)
  (define guesslist "")
  (define word-in-progress (make-string (string-length wordlist) #\*))
  (define wrong-count 0)
  (define gameover #f)
  (println word-in-progress)
  (send wiplabel set-label word-in-progress)
  ;; Revealing letters that are guessed
  (define (reveal key char count)
    (cond ((= count (string-length word-in-progress)) #t) 
      ((equal? (string-ref key count) char) (begin (string-set! word-in-progress count char) (reveal key char (+ 1 count))))
      ('else (reveal key char (+ 1 count)))))
  ;; Main game behavior
  (define (guess char) (if gameover (println "The game is over...")
                           (cond ((eq? difficulty 'easy) (println "Not yet implemented")) ;easy implementation
                             ((eq? difficulty 'hard) (println "Not yet implemented")) ;hard implementation
                             ('else (begin (set! guesslist (string-append guesslist char ", ")) ;normal implementation
                                          (if (string-contains? wordlist char)
                                              (begin (play SUCCESS)
                                                     (println "Correct guess!")
                                                     (reveal wordlist (string-ref char 0) 0) ;update word-in-progress here, then print it
                                                     (send wiplabel set-label word-in-progress)
                                                     (send guesslabel set-label guesslist)) 
                                              (begin (play FAILURE)
                                                     (set! wrong-count (+ wrong-count 1))
                                                     (when (> wrong-count 6) (set! gameover #t))
                                                     (send guesslabel set-label guesslist))))))))
  (define (dispatch msg)
    (cond ((eq? msg 'guess) guess)
          ('else (error "Invalid dispatch request" msg))))
  dispatch)

;; MAKES FRAME VISIBLE
(send f show #t)

;; Starts a new game on normal difficulty, makes testing faster
(define game (new-game 'normal))

;; Wrapper for guessing function, makes testing faster
(define (guess char) ((game 'guess) char))
