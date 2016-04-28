# Hang me, with sounds!
This is a template for using your repo's README.md as your project web page. 
I recommend you copy and paste into your README file. Delete this line and the one above it, customize everything else. Make it look good!

##Authors
willis Hand

Laura Lucaciu

##Overview
A brief description of the project is given here.  The description is 1 to 3 sentences long.  Be concise and clear.

##Screenshot
(insert a screenshot here. You may opt to get rid of the title for it. You need at least one screenshot. Make it actually appear here, don't just add a link.)

Here's a demonstration of how to display an image that's uploaded to this repo:
![screenshot showing env diagram](withdraw.png)

##Concepts Demonstrated
Identify the OPL concepts demonstrated in your project. Be brief. A simple list and example is sufficient. 
* **Data abstraction** is used to provide access to the elements of the RSS feed.
* The objects in the OpenGL world are represented with **recursive data structures.**
* **Symbolic language processing techniques** are used in the parser.

##External Technology and Libraries
Briefly describe the existing technology you utilized, and how you used it. Provide a link to that technology(ies).

##Favorite Scheme Expressions
####Willis
Each team member should identify a favorite expression or procedure, written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody?
Remember code looks something like this:
```scheme
(map (lambda (x) (foldr compose functions)) data)
```
####Laura 
This expression loads the deck image into a 'canvas'
```scheme
(define bm (make-object bitmap% (get-pure-port (string->url "https://raw.githubusercontent.com/oplS16projects/Laura-Willis/master/Deck.png"))))

(define pos -30)
(define mycanvas%
  (class canvas%
    (super-new)
    (inherit get-dc)
         (define/override (on-paint)
            (let ([my-dc (get-dc)])
              (send my-dc draw-bitmap bm pos pos)))))
```

##Additional Remarks
Anything else you want to say in your report. Can rename or remove this section.

#How to Download and Run
You may want to link to your latest release for easy downloading by people (such as Mark).

Include what file to run, what to do with that file, how to interact with the app when its running, etc. 
