def unique(integers)
  temp_array = []
  integers.each do |n|
    
      temp_array << n if !temp_array.include?(n)
    
   end 
  return temp_array
end

unique([1, 5, 2, 0, 2, -3, 1, 10])
unique([])
