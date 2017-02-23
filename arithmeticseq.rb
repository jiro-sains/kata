def nthterm(first, n, c)
  a=[]
  a[0] = first
  (1..n).each {|i| a[i] = a[i-1]+c}
  return a[n]
end

puts nthterm(1, 2, 3)
puts nthterm(2, 2, 2)
puts nthterm(-50, 10, 20)
