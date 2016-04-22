#lang racket/gui
(require net/url)
(require 2htdp/image)
(require htdp/draw)
(require lang/plt-pretty-big-text)

(define f (new frame% 
               [label "Hang me with sounds"]
               [width 600]
               [height 600]))



(define bm (make-object bitmap% (get-pure-port
                                 (string->url "https://raw.githubusercontent.com/oplS16projects/Laura-Willis/master/Deck.png"))) )

(define pos -55)

(define mycanvas%
  (class canvas%
    (super-new)
    (inherit get-dc)
         (define/override (on-paint)
            (let ([my-dc (get-dc)])
              (send my-dc draw-bitmap bm pos pos)))))

(define c (new mycanvas% [parent f]))

(define cclabel (new message% [parent f]
                          [label "Welcome to Hang me with sounds"] ))


  ; Add a text field 
(define txt (new text-field% [parent f] [label "Please enter a letter:"]))


(send f show #t)