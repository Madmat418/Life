class Cell
  def neighbors
    # Get neighbor cells
  end

  def position
    # Get [x,y] position of cell
  end

  def step
    # calculate next life cycle for this cell
  end

end

class Board
  def initialize
    # Create initial starting position for board
  end

  def step
    # iterate through each cell and calculate its next value, creating a new Board with those values
  end
end