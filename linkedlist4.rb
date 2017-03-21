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
    puts "entered in list"
    puts list.value
    if previous == nil
      puts "previous is nil"
      temp = list.next_node
      list.next_node = nil
      previous = list
      puts "temp: #{temp.value} previous after: #{previous.value}"
      reverse_list(temp, previous)
    else 
      puts "second time previous is not nil"
   
      #list.next_node = previous   
      puts "list.value: #{list.value} previous: #{previous.value}"
      if list.next_node != nil
        temp = list.next_node
        list.next_node = previous
        puts "list.next_node: #{temp.value} list: #{list.value}"
        reverse_list(temp, list)
      else
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
print_values(node2)
print_values(node1)
puts "-----"
reverse_list(node3)
#print node1.value
#print node2.value
#print node3.value
print_values(node3)
print_values(node2)
print_values(node1)



