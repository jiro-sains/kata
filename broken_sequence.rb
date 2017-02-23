def find_missing_number(sequence)
  #your code here
  if sequence.length==0  
    puts "zero, empty sequence"
  else
    a=sequence.split.map{|s| s.to_i}.sort
    if a[0]==0 || a[0]==2
      puts "one"
    else
      #a.each_with_index do |el, index|
      1.upto(a.length){
        |i| if (a[i-1])!=i then
             puts i 
            elsif (a[i-1])==a.length
             puts "zero because sequence isn't broken" 
        end
      }
  end
  end
end

#(x = false) or true
#x = (false || true)

find_missing_number("1 3 2 5")
find_missing_number("2 3 4 5")
find_missing_number("1 2 3 4")
find_missing_number("1 5")
find_missing_number("")
find_missing_number("2 1 4 3 a")
