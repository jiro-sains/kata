
def collatz(num)
	collatz_seq = [num]
	while num > 1
		num % 2 == 0 ? num/=2 : num = 3 * num + 1			
		collatz_seq << num
	end
	collatz_seq
end

def find_longest_collatz_seq
	collatz_length = (1..7).map { |num| collatz(num).length }
	longest = collatz_length.max
	collatz_length.index(longest) + 1
end

puts find_longest_collatz_seq
#puts collatz(