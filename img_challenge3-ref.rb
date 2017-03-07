class Image
  attr_accessor :original_matrix, :new_matrix, :dimension

  def initialize(original_matrix)
    @original_matrix = original_matrix
    @new_matrix = Marshal.load(Marshal.dump(original_matrix))
    @dimension = original_matrix[0].length
  end

  def output_original_image
    original_matrix.each{ |cols| puts cols.join }
  end

  def output_new_image
    new_matrix.each{ |cols| puts cols.join }
  end

  def set_one(row, column)
    if row >= 0 && row < dimension && column >= 0 && column < dimension
      new_matrix[row][column] = 1 
    end
  end

  def blur_one(row, column)
    set_one(row - 1, column) 
    set_one(row, column - 1)
    set_one(row + 1, column)
    set_one(row, column + 1)
  end

  def parse_image
    original_matrix.each_with_index do |subarray, row|
      subarray.each_index do |column|
        blur_one(row, column) if original_matrix[row][column] == 1
      end
    end
  end

  def blur(factor)
    factor.times do
      parse_image
      @original_matrix = Marshal.load(Marshal.dump(new_matrix))
    end
  end

end

image = Image.new([
  [0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,1]
  ])

image.output_original_image
image.blur(5)
puts "------"
image.output_new_image

