require 'pry'

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

def deep_search_left(number, tree, counter)
	counter = counter + 1
	#binding.pry
	while tree
		return tree if tree.payload == number
		return nil if tree.children == [] 
		tree = tree.children[0] 
		deep_search_left(number, tree, counter)
	end
end

def deep_search_right(number, tree)
	while tree
		return tree if tree.payload == number
		return nil if (tree.children == [] || tree.children[1] == [])
		tree = tree.children[1] 
		deep_search(number, tree)
	end
end


def deep_search(number, tree, counter)
	binding.pry
	counter = counter + 1
	if tree == nil
		return nil
	elsif tree.payload == number 
		puts "Equal"
		puts tree.payload == number 
		return tree
	else
		puts "payload #{tree.payload}"
		tree = tree.children[0] 
		puts "payload before recursion #{tree.payload}"
		deep_search(number, tree, counter)
		#return tree if tree.payload == number
		if tree.children[1] != []
			#binding.pry
			tree = tree.children[1] 
			deep_search(number, tree, counter)
		end
	end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])
#binding.pry
#puts deep_fifth_node.inspect
#puts trunk.children
alfa = deep_search_left(6,trunk, 0)
puts alfa.inspect
#puts alfa.payload
