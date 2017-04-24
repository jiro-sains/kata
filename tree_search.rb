#require 'pry'

class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end
end

def print_tree(tree)
	#ordered_array = []
	answer = 0
	while tree
		puts "I am here"
		puts tree.inspect
		#return tree if tree.payload == number
		if tree.left == nil && tree.right == nil
			puts "time to go back #{tree.payload}"
			#return
			#puts tree.payload
			return tree.payload 
		end
		leaf_left = tree.left
		puts "left #{leaf_left}"
		leaf_right = tree.right
		puts "right #{leaf_right}"
		while tree.left && answer == 0
			puts "i am in the while"
			leaf_left = tree.left
			#answer = print_tree(leaf_left)
			answer = print_tree(leaf_left)
		end
		if answer == 0
			return print_tree(leaf_right)
		else
			return answer
		end
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

def crazy(parent_tree, child_tree)
end

def go_left(tree)
	#puts "going in tree is #{tree.inspect}"
	if tree.left == nil
		puts "payload #{tree.payload}"
		up_tree = tree
		tree = nil
		return tree 
	end	
	while tree.left
		tree = tree.left
		go_left(tree)
		#puts tree.payload
	end
	#puts tree.payload
	#return tree.payload 
end

def scratch(tree)
	puts tree.left.payload
	puts tree.payload
	puts tree.right.payload
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


input_array = [3,1,4]
arbol = build_tree(input_array)
puts arbol.inspect
puts arbol.left.inspect
scratch(arbol)

