class Ghost
  COLOR = %w[white yellow purple red]

  def initialize
    color
  end

  def color
    return COLOR.sample
  end 

end

ghost=Ghost.new
puts ghost.color