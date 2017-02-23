class Ball
  attr_accessor :type

  def initialize(type='regular')
    @type=type
  end

  def ball_type(*type)
    if @type.size==0
      return "regular"
    else 
      return @type
    end
  end
end

ball1=Ball.new
ball2=Ball.new("super")
puts ball1.ball_type
puts ball2.ball_type

