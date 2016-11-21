class Chess
  attr_accessor :board, :knight

  def initialize
    @board = [
      %w(0 1 2 3 4 5 6 7), # 0
      %w(0 1 2 3 4 5 6 7), # 1
      %w(0 1 2 3 4 5 6 7), # 2
      %w(0 1 2 3 4 5 6 7), # 3
      %w(0 1 2 3 4 5 6 7), # 4
      %w(0 1 2 3 4 5 6 7), # 5
      %w(0 1 2 3 4 5 6 7), # 6
      %w(0 1 2 3 4 5 6 7)  # 7
    ]
    @knight = "k"
    @path = []
    @move_count = @path.length - 1
  end

  # shows simplest possible way to get from one square to another
  # outputs coordinates of all stops along the way and num of moves taken
  def knight_moves(initial, final)

  end

end
