require 'byebug'

class Knight

  def initialize
    @board = Board.new
  end

  # shows simplest possible way to get from one square to another
  # outputs coordinates of all stops along the way and num of moves taken
  def knight_moves(initial, final)
    @board.check_impossible_move(initial, final)

    search_queue = [Vertex.new(initial)]

    until search_queue.empty?
      test_vertex = search_queue.shift

      return show_path(make_path(test_vertex)) if test_vertex.value == final
      
     @board.possible_moves(test_vertex.value).each do |move|
        new_vertex = Vertex.new(move)
        new_vertex.parent = test_vertex
        test_vertex.children << move
        search_queue << new_vertex
      end 

    end
    "No path was found :("
  end
  
  def make_path(vertex)
    path = []
    until vertex.nil?
      path.unshift(vertex.value)
      vertex = vertex.parent
    end
    path
  end

  def show_path(path)
    if path.length - 1 > 1
      p "You made it in #{path.length - 1} moves! Here's your path:"
    else
      p "You made it in 1 move!  Here's your path:"
    end
    path.each { |move| puts "#{move}"}
  end
end

class Board
  def possible_moves(position)
    moves = [
      [position[0] + 1, position[1] + 2],
      [position[0] + 1, position[1] - 2],
      [position[0] - 1, position[1] + 2],
      [position[0] - 1, position[1] - 2],
      [position[0] + 2, position[1] + 1],
      [position[0] + 2, position[1] - 1],
      [position[0] - 2, position[1] + 1],
      [position[0] - 2, position[1] - 1]
    ]
    moves.select { |move| is_possible?(move)}
  end

  def is_possible?(position)
    position.all? { |num| num.between?(0,7) }
  end

  def check_impossible_move(initial, final)
    all_positions = initial + final
    if !all_positions.any? { |num| num.between?(0,7) }
      puts "You have entered a position that isn't on the board!  Try again."
    end
  end
end

class Vertex
  attr_accessor :value, :parent, :children

  def initialize(value = nil)
    @value = value
    @parent = nil
    @children = []

  end
end

# Tests
k = Knight.new

p k.knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
p k.knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
p k.knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]] || [[3,3],[1,2],[0,0]]