module BTreeSort

	class BTree
	  attr_accessor :payload, :left, :right

	  def initialize(payload, left, right)
	    @payload = payload
	    @left = left
	    @right = right
	  end
	end

  def self.build_tree(input_array)
	tree = BTree.new(nil,nil,nil)
	current_item = nil
	input_array.each_with_index do |item, index|
		new_item = BTree.new(item, nil, nil)
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

	def self.depth_search(tree, results)
		return if tree == nil
		depth_search(tree.left, results)
		depth_search(tree.right, results)
		results << tree.payload
	end

	def self.sort(input_array)
		output_array = []
		arbol = build_tree(input_array)
		depth_search(arbol, output_array)
		output_array
	end

end


