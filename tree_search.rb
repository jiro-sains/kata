require 'pry'

class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end

end

def build_tree(input_array)
	tree = BinaryTree.new(nil,nil,nil)
	current_item = tree
	input_array.each_with_index do |item, index|
		if index == 0
			tree = BinaryTree.new(input_array[0], nil, nil)
			current_item = tree
		else
			#puts "index is #{index}"
			#puts "item is #{item}"
			#puts current_item.inspect
			if item > current_item.payload
				puts "going right"
				new_item = BinaryTree.new(item, nil, nil)
				if tree.right 
					current_item = tree.right
					current_item.right = item
				else
					tree.right = new_item
				end
			else
				puts "going left"
				tree.left = item
			end
		end
	end
	tree
end
#seven = BinaryTree.new(7, nil, nil)
#five  = BinaryTree.new(5, nil, nil)
#four  = BinaryTree.new(4, nil, nil)
#six   = BinaryTree.new(6, nil, seven)
#three = BinaryTree.new(3, nil, six)
#two   = BinaryTree.new(2, four, five)
#trunk = BinaryTree.new(1, two, three)

#puts trunk.payload
#puts trunk.left.payload
#puts trunk.right.payload

input_array = [1,2,3]
arbol = build_tree(input_array)
puts arbol.inspect
puts arbol.right.inspect

