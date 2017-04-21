require 'pry'

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

def breadth_search(number, tree)
	while tree
		return tree if tree.payload == number
		return nil if tree.children == [] 
		leaf_left = tree.children[0]
		leaf_right = tree.children[1] 
		answer =  breadth_search(number, leaf_right)
		return answer ? answer : breadth_search(number, leaf_left)
	end
end


def deep_search(number, tree)
	answer = 0
	while tree
		return tree if tree.payload == number
		answer = 1 if tree.children == []
		leaf_left = tree.children[0]
		leaf_right = tree.children[1] 
		while tree.children[0] && answer == 0
			leaf_left = tree.children[0]
			answer = deep_search(number, leaf_left)
		end
		if answer == 1 || answer == nil
			return deep_search(number, leaf_right)
		else
			return answer
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
alfa = deep_search(5,trunk)
puts alfa.inspect
beta = breadth_search(5,trunk)
puts beta.inspect
