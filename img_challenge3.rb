  def copy_matrix(old_matrix)
    Marshal.load(Marshal.dump(old_matrix))
  end

  def output_image(original_matrix)
    original_matrix.each{ |cols| puts cols.join }
  end

  def set_one(matrix, row, column)
    if row >= 0 && row < matrix.length && column >= 0 && column < matrix[row].length
      matrix[row][column] = 1 
    end
  end

  def blur(matrix, row, column, factor)
    blur_upper_right(matrix, row, column, factor)
    blur_bottom_right(matrix, row, column, factor) 
    blur_upper_left(matrix, row, column, factor)
    blur_bottom_left(matrix, row, column, factor) 
    #blur_upper_left_ref(matrix, row, column, factor)
  end

  #doesn't work
  def blur_upper_left_ref(matrix, row, column, factor)
    counter = 0
    (row-factor..row).each do |i|
        (0..counter).each do |counter|
          (0..counter).each{ |j| set_one(matrix, i, column-j) } 
        end
    end
  end

  def blur_upper_left(matrix, row, column, factor)
    counter = 0
    (row-factor..row).each do |i|
        for counter in 0..counter do 
          (0..counter).each{ |j| set_one(matrix, i, column-j) } 
          counter += 1
        end
    end
  end

  def blur_bottom_left(matrix, row, column, factor)
    counter = 0
    (row..row+factor).reverse_each do |i|
        for counter in 0..counter do 
          (0..counter).each{ |j| set_one(matrix, i, column-j) }  
          counter += 1              
        end
    end
  end

  def blur_upper_right(matrix, row, column, factor)
    counter = 0
    (row-factor..row).each do |i|
        for counter in 0..counter do 
          (0..counter).reverse_each{ |j| set_one(matrix, i, column+j) } 
          counter += 1
        end
    end
  end

  def blur_bottom_right(matrix, row, column, factor)
    counter = 0
    (row..row+factor).reverse_each do |i|
        for counter in 0..counter do 
          (0..counter).each{ |j| set_one(matrix, i, column+j) }
          counter += 1              
        end
    end
  end

  def parse_image(original_matrix, new_matrix)
    original_matrix.each_with_index do |subarray, row|
      subarray.each_index do |column|
        blur(new_matrix, row, column, 2) if original_matrix[row][column] == 1
      end
    end
  end


original_matrix = ([[0,0,0,0,0,0,0,0],
                    [0,0,0,0,0,0,0,0],
                    [0,0,0,0,0,0,0,0],
                    [0,0,0,0,0,0,0,0],
                    [0,0,0,0,1,0,0,0],
                    [0,0,0,0,0,0,0,0],
                    [0,0,0,0,0,0,0,0],
                    [0,0,0,0,0,0,0,0],
                    [0,0,0,0,0,0,0,1]])
output_image(original_matrix)
new_matrix = copy_matrix(original_matrix)
parse_image(original_matrix, new_matrix)
puts "------"
output_image(new_matrix)


