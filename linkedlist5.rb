require 'pry'

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def is_list_infinite(list_node)
  tortoise = hare = list_node 
  while hare && hare.next_node
    hare = hare.next_node.next_node
    tortoise = tortoise.next_node
    return true if hare == tortoise        
  end
  return false
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3
#print_values(node3)
puts is_list_infinite(node3)
