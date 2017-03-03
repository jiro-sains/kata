  #def initialize(data)
  #  @original_matrix = data
  #end

  def copy_matrix(old_matrix)
    Marshal.load(Marshal.dump(old_matrix))
  end

  def output_image(original_matrix)
    original_matrix.each {|cols| puts cols.join}
  end

  def set_one(matrix, row, column)
    if row >= 0 && row < matrix.length && column >= 0 && column < matrix[row].length
      matrix[row][column] = 1 
    end
  end

  def blur_vertical_horizontal(matrix, row, column, factor)
    (1..factor).each do |i|
      set_one(matrix, row - i, column) 
      set_one(matrix, row, column - i)
      set_one(matrix, row + i, column)
      set_one(matrix, row, column + i)
    end
  end

  def blur_diagonal(matrix, row, column, factor)
    (1..factor-1).each do |i|
      set_one(matrix, row - i, column - 1) 
      set_one(matrix, row + i, column + 1)
      set_one(matrix, row + 1, column - i)
      set_one(matrix, row - 1, column + i)
    end
  end

  def blur_upper_left(matrix, row, column, factor)
    puts "row", row
    puts "column", column
    counter = 0
    (row-factor..row).reverse_each do |i|
        puts "I am in the row loop", i
        (column..column+factor-counter).each do |j|          
          puts "I am in the column loop", j
          set_one(matrix, i, j) 
          counter = counter + 1
        end
    end
  end

  def parse_image(original_matrix, new_matrix)
    original_matrix.each_with_index do |subarray, row|
      subarray.each_index do |column|
        #puts String(row) << " " << String(column) << "..." << String(@data[row][column])
        if original_matrix[row][column] == 1 
          #blur_vertical_horizontal(new_matrix, row, column, 3)
          #blur_diagonal(new_matrix, row, column, 3)  
          blur_upper_left(new_matrix, row, column, 3)       
        end
      end
    end
  end


original_matrix = ([[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,1,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]])
output_image(original_matrix)
new_matrix = copy_matrix(original_matrix)
parse_image(original_matrix, new_matrix)
puts "------"
output_image(new_matrix)



#image.parse_image
#image.output_image2
