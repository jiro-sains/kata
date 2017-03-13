class LinkedList
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


class Stack
  attr_accessor :node, :reversed_node

  def self.push(value)
    @node = LinkedList.new(value, @node)
  end

  def self.reverse
    while @node
      @reversed_node = LinkedList.new(@node.value, @reversed_node)
      @node = @node.next_node
      self.reverse
    end
    return @reversed_node
  end

    def self.pop
      if @node
        #return @node.value
        @node = @node.next_node
      end
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
puts "------"
stack = Stack.pop
print_values(stack)
puts "------"
stack = Stack.reverse
print_values(stack)