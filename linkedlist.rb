class LinkedList
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


class Stack
  #attr_accessor :value, :next_node, :node
  attr_accessor :node

  def initialize(value, next_node=nil)
    @value = nil
    #@next_node = next_node
  end

    # Push a value onto the stack
  def self.push(value)
    if !@node
      @node = self.new(value)
    else
      @node = self.new(value, @node)
    end
  end

  def self.new_list
    if @node
      push(@node.next_node.value)
    else
      push(nil)
      return
    end
  end

    def self.pop
        # I RETURN A VALUE
      if @node
        puts @node.value
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
stack = Stack.pop
print_values(stack)