
class Stack
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

  def self.push(value)
    @node = self.new(value, @node)
  end

  def self.pop
    if @node
      puts @node.value
      #return @node.value
      @node = @node.next_node
    end
  end

end

def reverse_list(list)
  if list
    reverse_list(list.next_node)
  else
    return
  end
  print "#{list.value} --> " 
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


stack = Stack.push(37)
print_values(stack)
puts "------"
stack = Stack.push(99)
print_values(stack)
puts "------"
stack = Stack.push(12)
print_values(stack)
puts "------"
stack = Stack.push(13)
print_values(stack)
stack = Stack.pop
puts "------"
print_values(stack)
stack = Stack.pop
puts "------"
print_values(stack)
stack = Stack.pop
puts "------"
print_values(stack)
stack = Stack.pop
puts "------"
print_values(stack)
#reverse_list(stack)

