# Life
Game of Life Simulation

Simple ruby program similar to Conway's Game of Life

Intention is to find the 20th generation of a lifecycle which has the 1st generation that appears as:
[
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,1,1,0,0,0,0,0,0],
  [0,0,0,0,2,0,0,0,0,0],
  [0,0,0,1,2,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,1,0,0,0,0,0,0,0],
  [0,2,1,0,0,0,0,0,0,0],
  [0,2,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
]

Run the program with `ruby life.rb` from the command line.  This will render each generation of the life cycle, the last one will be the 20th.