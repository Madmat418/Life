class Cell
  attr_accessor :age, :life

  def initialize(age, life)
    @age = age
    @life = life
  end

  def neighbors(position)
    results = []
    # Get limits of board
    row_limit = @life.board.count - 1
    column_limit = @life.board[0].count - 1

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
    return results
  end

  def step(position)
    adult_neighbor_count = 0
    total_neighbor_count = 0
    neighbors(position).each do |cell_position|
      cell = @life.board[cell_position[0]][cell_position[1]]
      if cell.age > 0
        total_neighbor_count += 1
      end

      if cell.age == 2
        adult_neighbor_count += 1
      end
    end

    # Check each cases to determine what value to return for this cell's age.
    case @age
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
    # When no cases pass, the cell has died or remained dead
    return 0
  end

end

class Life
  attr_accessor :board

  def initialize(array)
    create_board(array)
  end

  def create_board(array)
    values = []
    array.each do |row|
      row_cells = []
      row.each do |cell|
        row_cells << Cell.new(cell, self)
      end
      values << row_cells
    end
    @board = values
  end

  def step(x = 1)
    x.times do
      values = []
      @board.each_with_index do |row, x|
        row_cells = []
        row.each_with_index do |cell, y|
          row_cells << cell.step([x, y])
        end
        values << row_cells
      end
      create_board(values)
      render
    end
  end

  def render
    puts "===================="

    @board.each do |row|
      row_string = ""
      row.each do |cell|
        row_string << "#{cell.age}  "
      end
      puts row_string
    end
  end
end

array = [
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

life = Life.new(array)
life.render
life.step(19)
