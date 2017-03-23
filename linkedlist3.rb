
class LinkedList
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_accessor :node

  def initialize
    @node = nil
  end

  def push(value)
    @node = LinkedList.new(value, @node)
  end


  def pop
    if @node
      top_node = @node.value
      @node = @node.next_node
      return top_node
    end
  end

end

def reverse_list_old(list)
  if list
    reverse_list(list.next_node)
  else
    return
  end
  print "#{list.value} --> " 
end

def reverse_list(list_node)
  reverse = Stack.new
  while list_node
    temp_value = list_node.value
    reverse.push(list_node.value)
    list_node = list_node.next_node
  end
  return reverse
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

stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)


print_values(stack.node)

reversed_stack = reverse_list(stack.node)
puts "------"
print_values(reversed_stack.node)

#binding.pry
#print_values(reversed_stack.node)
#stack.pop
#print_values(stack.node)
#stack.pop

#reverse_list(stack)
#binding.pry


