class Cell
  def neighbors(position)
    results = []
    # Get limits of board
    row_limit = self.board.count
    column_limit = self.board[0].count
    x = [0, position[0] - 1].max
    while x <= [position[0] + 1, row_limit].min do
      y = [0, position[1] - 1].max
      while y <= [position[1] + 1, column_limit].min do
        unless [x, y] == position
          results << [x,y]
        end
        y += 1
      end
      x += 1
    end
  end

  def step(position)
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