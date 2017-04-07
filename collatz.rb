
def collatz(num)
	collatz_seq = []
	collatz_seq << num
	while num > 1
		num%2 == 0 ? (num = num/2) : (num = 3*num + 1)			
		collatz_seq <<  num
	end
	return collatz_seq
end

def find_longest_collatz_seq
	collatz_length = []
	(1..1000000).each {|num| collatz_length << collatz(num).length}
	longest = collatz_length.max
	return (collatz_length.index longest) + 1
end

puts find_longest_collatz_seq
#puts collatz(2)