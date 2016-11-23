require 'byebug'

class Knight

  # shows simplest possible way to get from one square to another
  # outputs coordinates of all stops along the way and num of moves taken
  def knight_moves(initial, final)
    search_queue = [Vertex.new(initial)]

    until search_queue.empty?
      test_vertex = search_queue.shift

      return show_path(make_path(test_vertex)) if test_vertex.value == final
      
      test_vertex.children.each do |value|
        unless value.any? { |num| num < 0 || num > 7}
          new_vertex = Vertex.new(value)
          new_vertex.parent = test_vertex
          search_queue << new_vertex
        end
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

class Vertex
  attr_accessor :value, :parent, :children

  def initialize(value = nil)
    @value = value
    @parent = nil
    @children = [
      [value[0] + 1, value[1] + 2],
      [value[0] + 1, value[1] - 2],
      [value[0] - 1, value[1] + 2],
      [value[0] - 1, value[1] - 2],
      [value[0] + 2, value[1] + 1],
      [value[0] + 2, value[1] - 1],
      [value[0] - 2, value[1] + 1],
      [value[0] - 2, value[1] - 1]
    ]

  end
end

# Tests
k = Knight.new

p k.knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
p k.knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
p k.knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]] || [[3,3],[1,2],[0,0]]