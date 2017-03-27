class Animal
	def eat
		puts "yum yum yum"
	end
end

class Dog < Animal
	def bark
		puts "woof"
	end
end 

class Cat < Animal
	def meow
		puts "meow"
	end
end 

class Duck < Animal
	def quack
		puts "quack"
	end
end

class GoldenRetriever < Dog
	def fetch
		puts "run and get it"
	end
end

animal = Animal.new
animal.eat

dog = Dog.new
dog.eat
dog.bark

cat = Cat.new
cat.eat
cat.meow

perro = GoldenRetriever.new
perro.bark
perro.eat
perro.fetch
