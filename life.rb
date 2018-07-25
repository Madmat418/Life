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
    adult_neighbor_count = 0
    total_neighbor_count = 0
    neighbors(position).each do |cell_position|
      cell = self.board[cell[0]][cell[1]]
      if cell.age > 0
        total_neighbor_count += 1
      end

      if cell.age == 2
        adult_neighbor_count += 1
      end
    end

    case self.age
    when 0
      if adult_neighbor_count == 2 && total_neighbor_count == 2
        return 1
      end
    when 1
      if (1..5) === total_neighbor_count
        return 2
      end
    when 2
      if (1..3) === total_neighbor_count
        return 3
      end
    end

    return 0
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