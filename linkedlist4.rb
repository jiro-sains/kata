class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
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

def reverse_list(list, previous = nil)
  if list
    if previous == nil
      temp = list.next_node
      list.next_node = nil
      previous = list
      reverse_list(temp, previous)
    else 
      if list.next_node != nil
        temp = list.next_node
        list.next_node = previous
        reverse_list(temp, list)
      else
        list.next_node = previous
        return
      end
    end
  else
    return
  end
end

node1 = LinkedListNode.new(1)
node2 = LinkedListNode.new(2, node1)
node3 = LinkedListNode.new(3, node2)

print_values(node3)
puts "-----"
reverse_list(node3)

print_values(node1)



