
class Garnacha
  attr_accessor :type, :filling, :toping

  def initialize(type, filling, toping)
    @type = type
    @filling = filling
    @toping = toping
  end

  def output
    puts "Here is your #{self.filling} #{self.type} with #{self.toping}. Enjoy!"
  end

end

order = Garnacha.new('taco', 'beef', 'salsa')
order.output

