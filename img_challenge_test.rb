class Image
  attr_accessor :original_matrix

  def initialize(data)
    @original_matrix = data
  end

  def copy_matrix(old_matrix)
    Marshal.load(Marshal.dump(old_matrix))
  end

  def output_image
    original_matrix.each {|cols| puts cols.join}
  end

  def set_one(matrix, row, column)
    if row >= 0 && row < matrix.length && column >= 0 && column < matrix[row].length
      matrix[row][column] = 1 
    end
  end

  def blur(matrix,row, column)
    set_one(matrix, row - 1, column) 
    set_one(matrix, row, column - 1)
    set_one(matrix, row + 1, column)
    set_one(matrix, row, column + 1)
  end

  def parse_image(original_matrix, new_matrix)
    original_matrix.each_with_index do |subarray, row|
      subarray.each_index do |column|
        #puts String(row) << " " << String(column) << "..." << String(@data[row][column])
        if original_matrix[row][column] == 1 
          blur(new_matrix, row, column)          
        end
      end
    end
  end
end

original_matrix =  [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]
image = Image.new(original_matrix)
image.output_image
#new_matrix = copy_matrix(original_matrix)
#parse_image(original_matrix, new_matrix)
#puts "------"
#output_image(new_matrix)

