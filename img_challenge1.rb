class Image
  attr_accessor :data

  def initialize(data)
    @data=data
  end

  def output_image
    @data.each {|cols| puts cols.join}
  end
end

image = Image.new([[0,0,0,0],[1,0,1,0],[1,1,1,0],[0,1,1,1]])
image.output_image

