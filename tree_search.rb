require 'pry'

class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end
end

class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.pop
  end
end

def traverse_tree(tree)
	a = nil
	#puts tree.payload
	while tree 
		if tree.left == nil and tree.right == nil
			a = tree.payload
			puts "this is where I am returning"
			return a
		end
		left_branch = tree.left
		right_branch = tree.right
		while tree.left != nil
			#puts "I am in the second while"
			left_branch = tree.left
			return traverse_tree(left_branch)
		end
		puts "tree after while #{tree.payload}"
	end
end


def depth_search(tree)
	return tree if tree.left == nil and tree.right == nil
	left = depth_search(tree.left) if tree.left
	right = depth_search(tree.right) if tree.right
	tree.left = nil if left
	tree.right = nil if right
	left || right
end


def scratch(tree)
	queue = MyQueue.new
	results = []
	while tree
		if results != []
			results << tree.payload
			tree = queue.dequeue
		end
		while tree.left
			queue.enqueue(tree)
			tree = tree.left
		end		
		results << tree.payload
		tree = queue.dequeue
		if tree.right
			results << tree.payload
			results << tree.right.payload
			tree = queue.dequeue
		else
			results << tree.payload
			tree = queue.dequeue
		end
		binding.pry
	end
	results
end

def build_tree(input_array)
	tree = BinaryTree.new(nil,nil,nil)
	current_item = nil
	input_array.each_with_index do |item, index|
		new_item = BinaryTree.new(item, nil, nil)
		if index == 0
			tree = new_item
			current_item = new_item
		else
			if item > current_item.payload	
				if current_item.right == nil
					current_item.right = new_item
				else
					current_item = current_item.right
					current_item.right = new_item
				end
			else
				if current_item.left == nil
					current_item.left = new_item
				else
					current_item = current_item.left
					current_item.left = new_item
				end
			end
		end
	end
	tree
end


input_array = [7,4,9,1]
arbol = build_tree(input_array)
puts arbol.inspect
#puts arbol.left.left.payload
#puts arbol.left.payload
#puts arbol.payload
#puts arbol.right.payload


arbol_ordenado = scratch(arbol)
#arbol_ordenado = depth_search(arbol)
puts arbol_ordenado.inspect
arbol_ordenado2 = depth_search(arbol)
puts arbol_ordenado2.inspect