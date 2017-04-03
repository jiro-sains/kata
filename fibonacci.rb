
def recursive_fib(num)
	if num >= 2
		result = recursive_fib(num-2) + recursive_fib(num-1)
	else 
		result = num
	end
	return result
end

def iterative_fib(num)
	fib = [0,1]
	(2..num).each { |i| fib[i] = fib[i-1] + fib [i-2] } if num >= 2 
	return fib[num]
end

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end
