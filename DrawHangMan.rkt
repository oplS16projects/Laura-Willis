#lang racket


(require htdp/draw)
(require lang/plt-pretty-big-text)
(define (draw body-part)
  (cond
    [(eq? body-part 'deck)
     (draw-solid-line (make-posn 20 20)
                      (make-posn 20 170)
                      'black)
     (draw-solid-line (make-posn 20 20)
                      (make-posn 110 20)
                      'black)
     (draw-solid-line (make-posn 110 20)
                      (make-posn 110 50)
                      'black)]
    
    [(eq? body-part 'body)
     (draw-solid-line (make-posn 110 70)
                      (make-posn 110 100)
                      'black)]

    [(eq? body-part 'head)
    (draw-circle (make-posn 110 60) 10)]
    [(eq? body-part 'right-leg)
     (draw-solid-line (make-posn 110 100)
                      (make-posn 130 110)
                      'black)]
    [(eq? body-part 'left-leg)
     (draw-solid-line (make-posn 110 100)
                      (make-posn 90 110)
                      'black)]
    [(eq? body-part 'right-arm)
     (draw-solid-line (make-posn 130 90)
                      (make-posn 110 80)
                      'black)]
    [(eq? body-part 'left-arm)
     (draw-solid-line (make-posn 110 80)
                      (make-posn 90 90)
                      'black)]
   ))
