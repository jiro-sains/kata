module Image
  attr_accessor :original_matrix

  def self.new(data)
    @original_matrix = data
  end

  def self.copy_matrix
    Marshal.load(Marshal.dump(original_matrix))
  end

  def self.set_one(matrix, row, column)
    if row >= 0 && row < matrix.length && column >= 0 && column < matrix[row].length
      matrix[row][column] = 1 
    end
  end

  def self.blur(matrix,row, column)
    set_one(matrix, row - 1, column) 
    set_one(matrix, row, column - 1)
    set_one(matrix, row + 1, column)
    set_one(matrix, row, column + 1)
  end

  def self.parse_image(new_matrix)
    original_matrix.each_with_index do |subarray, row|
      subarray.each_index do |column|
        if original_matrix[row][column] == 1 
          blur(new_matrix, row, column)          
        end
      end
    end
    new_matrix
  end

  def self.blur_data
    new_matrix = image.copy_matrix
    image.parse_image(new_matrix)
    #return new_matrix
  end

end