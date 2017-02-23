class Image
  attr_accessor :data

  def initialize(data)
    @data=data
  end

  def output_image
    @data.each {|cols| puts cols.join}
  end

  def output_image2
    #[0..@data.length].each {|row| puts @data[row]}
    @data.each_index do |i|
      subarray = @data[i] 
      subarray.each_index do |j|
        puts String(i) << " " << String(j) << "..." << String(@data[i][j])
      end
    end
  end

  def parse_image
    flag=false
    @data.each_index do |row|
      break if flag==true
      subarray = @data[row] 
      subarray.each_index do |column|
        #puts String(row) << " " << String(column) << "..." << String(@data[row][column])
        if @data[row][column]==1
          @data[row-1][column]=1 unless row==0
          @data[row][column-1]=1 unless column==0
          @data[row+1][column]=1 unless row==(@data.length-1)
          @data[row][column+1]=1 unless column==(subarray.length-1)
          flag=true
          break
        end
      end
    end
  end
end

image = Image.new([[0,0,0,1],[0,0,1,0],[0,0,0,0],[0,0,0,0]])
image.output_image
puts "------"
image.parse_image
image.output_image
