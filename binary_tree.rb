require 'byebug'

class Node
  attr_accessor :value, :left_child, :right_child, :parent

  def initialize(value=nil, parent=nil)
    @value = value
    @parent = parent
    @left_child = nil
    @right_child = nil
  end
end

# assumes array is sorted, returns binary tree of Nodes
# then refactor to handle data that isn't presorted can't be easily sorted
# array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

class BinaryTree
	attr_accessor :root

	def initialize
		@root = nil
	end

	def balanced_tree(array, parent=nil)

		if array.length <= 0
			return nil
		elsif array.length == 1
			new_node = Node.new(array[0], parent)
		else
			mid_index = array.length / 2

			if @root.nil?
				@root = Node.new(array[mid_index], parent)
				new_node = @root
			else
				new_node = Node.new(array[mid_index], parent)
			end

			new_node.left_child = balanced_tree(array[0..mid_index - 1], new_node)
			new_node.right_child = balanced_tree(array[mid_index + 1..-1], new_node)

			new_node
		end
	end

	# builds binary search tree for unsorted array
	def build_tree(array, parent=nil)

	end

	# returns node at which target value is located using BFS
	def breadth_first_search(target)

	end

	# returns node at which target vlaue is located using DFS
	# use an array acting as stack
	def depth_first_search(target)

	end

	# same as depth_first_search but using recursion
	def dfs_rec

	end
end

array = [1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345] 
array.sort!

tree = BinaryTree.new
p tree.root