#lang racket/gui
(require net/url)
(require lang/plt-pretty-big-text)

(define f (new frame% 
               [label "Hang me with sounds"]
               [width 600]
               [height 600]))

(define bm (make-object bitmap% (get-pure-port
                                 (string->url "https://raw.githubusercontent.com/oplS16projects/Laura-Willis/master/Deck.png"))))

(define pos -30)

(define mycanvas%
  (class canvas%
    (super-new)
     (inherit get-dc)
         (define/override (on-paint)
            (let ([my-dc (get-dc)])
              (send my-dc draw-bitmap bm pos pos)
       (define blue-brush (new brush% [color "red"]))
              (send my-dc set-brush blue-brush)
              (send my-dc draw-ellipse 315 110 80 80)
       (define yellow-brush (new brush% [color "yellow"]))
              (send my-dc set-brush yellow-brush)
              (send my-dc draw-rectangle 330 130 10 10)
              (send my-dc draw-rectangle 370 130 10 10)
              ;mouth
              (send my-dc draw-line 345 165 365 165)
              ;body
              (send my-dc draw-line 350 190 350 320)
              ;left arm
              (send my-dc draw-line 350 240 300 190)
              ;right arm
              (send my-dc draw-line 350 240 400 190)
             ;right leg
              (send my-dc draw-line 350 320 400 390)
               ;left leg
              (send my-dc draw-line 350 320 300 390)
              ))))

(define c (new mycanvas% [parent f]))

(define cclabel (new message% [parent f]
                          [label "Welcome to Hang me with sounds"] ))


   ; Add a text field to the dialog
(define txt (new text-field% [parent f] [label "Please enter a letter:"]))


(send f show #t)