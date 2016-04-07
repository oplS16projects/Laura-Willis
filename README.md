# Project Title:  Hang me, with sounds!

### Statement

  Hangman is a popular word game in which one player (the "chooser") chooses a secret word and another player (the "guesser") attempts to guess the word one letter at a time. If a guessed letter appears in the word, all instances of it are revealed. If not, the guesser loses a chance. If the guesser figures out the secret word before he or she runs out of chances, he or she wins. If not, the player who chose the word wins. 

### Analysis
  What is this game special than the others? First that would be that this game provides difficulties levels and sound.
  The basic mechanism of the game for this project is that the computer will randomly select a word from a text file ("dictionary.txt"). The list of words is provided by this file which are used by the computer to randomly pick. The user is able to chose the level difficulty to play. These levels are: easy, normal and hard.
  The user will then try to guess what the word is. As the user makes correct, or incorrect guesses, the hangman or word will be updated. This will be handled by the constructor "new-game" from game object.
  The hangman's body parts are drawn by a function draw-body-part which draws the pieces of a hangman figure using canvas. The figure is drawn one body part at a time. The function consumes one of the seven symbols 'deck, 'head, 'body, 'right-leg, 'letf-leg, 'right-arm, 'left-arm. This six pieces of the hangman are: head, body, left arm, right arm, left leg, right leg. It always returns true and draws the matching part of the figure.
  The "guess" function will then check the guess, update the game state accordingly, and request the canvas redraw with the new state.
  If the player makes 6 wrong guesses, the entire figure has been drawn and game is over.
  There will be four sounds played using rsound audio streams. These .wav files will be played for correct guesses, wrong guesses, winning, and losing.
  
### Data set or other source materials
  External libraries that we are going to use are: htdp/draw, lang/plt-pretty-big-text, racket/text-field box, racket/gui/bas, and rsound. Additionally an external .txt file containing words from the english languague will be utilized.

### Deliverable and Demonstration

  At the end at live demo we'll present a popular interactive game, with difficulties levels, and sound. 

### Evaluation of Results
????

## Architecture Diagram
?????

## Schedule
Explain how you will go from proposal to finished product. 

There are three deliverable milestones to explicitly define, below.

The nature of deliverables depend on your project, but may include things like processed data ready for import, core algorithms implemented, interface design prototyped, etc. 

You will be expected to turn in code, documentation, and data (as appropriate) at each of these stages.

Write concrete steps for your schedule to move from concept to working system. 

### First Milestone (Fri Apr 15)
On this day will be turned on the basic framework of the game.

### Second Milestone (Fri Apr 22)
On this day will be turned on the hard difficulties levels, gui, touch ups.

### Final Presentation (last week of semester)
Final will be 

## Group Responsibilities

Willis is the leader of Happy Feet team. He is primarily responsible for code integration. This work may be shared, but the team lead has default responsibility.

### Willis Hand Scheme @


### Laura Lucaciu Lambda @
  Will work on graphics part, drawing the hangman, gui part.
