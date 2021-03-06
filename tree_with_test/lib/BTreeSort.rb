module BTreeSort

  class BTree
    attr_accessor :payload, :left, :right

    def initialize(payload, left, right)
      @payload = payload
      @left = left
      @right = right
    end
  end

  def self.depth_search(tree, results)
  	return if tree == nil
  	depth_search(tree.left, results)
    results << tree
  	depth_search(tree.right, results)
  	results << tree if !results.include?(tree)
  end

  def self.return_array(results)
    final_results = []
    results.each { |item| final_results << item.payload }
    final_results
  end

  def self.right_leaf(tree, item)
    while tree.right && (item > tree.payload)
      tree = tree.right
    end
    tree
  end

  def self.left_leaf(tree, item)
    while tree.left && (item < tree.payload)
      tree = tree.left
    end
    tree
  end

  def self.build_tree(input_array)
  	tree = BTree.new(nil,nil,nil)
  	input_array.each_with_index do |item, index|
      new_item = BTree.new(item,nil,nil)
  		if index == 0
  			tree = new_item
  		else
  			if item > tree.payload	
          node_to_be_added_to = right_leaf(tree,item)
        else
          node_to_be_added_to = left_leaf(tree,item)
        end
        if item > node_to_be_added_to.payload
          node_to_be_added_to.right = new_item
        else
          node_to_be_added_to.left = new_item
        end
      end
    end
  	tree
  end

  def self.sort(input_array)
  	output_array = []
  	arbol = build_tree(input_array)
  	depth_search(arbol, output_array)
  	return_array(output_array)
  end

end


