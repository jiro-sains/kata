
[1mFrom:[0m /vagrant/src/kata/tree_search.rb @ line 77 Object#scratch:

    [1;34m58[0m: [32mdef[0m [1;34mscratch[0m(tree)
    [1;34m59[0m: 	queue = [1;34;4mMyQueue[0m.new
    [1;34m60[0m: 	results = []
    [1;34m61[0m: 	[32mwhile[0m tree
    [1;34m62[0m: 		[32mwhile[0m tree.left
    [1;34m63[0m: 			queue.enqueue(tree)
    [1;34m64[0m: 			tree = tree.left
    [1;34m65[0m: 		[32mend[0m		
    [1;34m66[0m: 		results << tree.payload
    [1;34m67[0m: 		tree = queue.dequeue
    [1;34m68[0m: 		binding.pry
    [1;34m69[0m: 		[32mif[0m tree.right
    [1;34m70[0m: 			results << tree.payload
    [1;34m71[0m: 			results << tree.right.payload
    [1;34m72[0m: 			tree = queue.dequeue
    [1;34m73[0m: 		[32melse[0m
    [1;34m74[0m: 			results << tree.payload
    [1;34m75[0m: 			tree = queue.dequeue
    [1;34m76[0m: 		[32mend[0m
 => [1;34m77[0m: 		binding.pry
    [1;34m78[0m: 	[32mend[0m
    [1;34m79[0m: 	results
    [1;34m80[0m: [32mend[0m

