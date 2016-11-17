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

class BinaryTree
	attr_accessor :root

	def initialize
		@root = nil
	end

	def build_tree_sorted(array, parent=nil)

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
	# tree is unbalanced
	def build_tree(array)
		@root = Node.new(array[0])
		temp_root = @root

		array[1..-1].each do |node_value|
			insert_node(node_value, temp_root)
		end
	end

	# helper which recursively searches through tree to find correct place
	def insert_node(node_value, root, parent = nil)
		if root.nil?
			new_node = Node.new(node_value)
			
			if node_value < parent.value
				parent.left_child = new_node
			else
				parent.right_child = new_node
			end
		elsif node_value < root.value || node_value == root.value
			parent = root
			root = root.left_child
			insert_node(node_value, root, parent)
		elsif node_value > root.value 
			# byebug
			parent = root
			root = root.right_child
			insert_node(node_value, root, parent)
		end

	end

	# returns node at which target value is located using BFS
	# use array acting as a queue to track all child nodes left to search
	def breadth_first_search(target)
		search_queue = []
		initial_node = @root
		search_queue << initial_node

		return nil if @root.nil?

		until search_queue.empty?
			test_node = search_queue.shift

			if test_node.value == target
				return test_node
			else
				search_queue << test_node.left_child if !test_node.left_child.nil?
				search_queue << test_node.right_child if !test_node.right_child.nil?
			end
		end
		nil
	end

	# returns node at which target vlaue is located using DFS
	# use an array acting as stack
	def depth_first_search(target)

	end

	# same as depth_first_search but using recursion
	def dfs_rec

	end
end

# array = [1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345] 
array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = BinaryTree.new