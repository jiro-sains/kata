class Animal
	def eat
		puts "yum yum yum"
	end
end

class Dog < Animal
	def bark
		put "woof"
	end
end 

animal = Animal.new
animal.eat

dog = Dog.new
dog.eat
dog.bark