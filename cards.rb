class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
  	@rank = rank
  	@suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"   
  end

  def self.random_card
    self.new(rand(10), :spades)
  end
end

class Deck
  SUITS = %i[spades diamonds hearts diamonds]
  RANKS = %w[ace 1 2 3 4 5 6 7 8 9 10 Jack Queen King]

  def initialize  
    @cards = []
    assign_ranks_and_suits
  end

  def assign_ranks_and_suits
    RANKS.each do |rank|
      SUITS.each do |suit|
       create_card(rank, suit)
      end
    end
  end

  def create_card(rank, suit)
    @cards << Card.new(rank, suit)
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.shift
  end  

  def output
    #@cards.each { |card| card.output_card }
    @cards.each(&:output_card)

  end
end

deck = Deck.new
deck.shuffle
deck.output
deck.deal
puts "deal"
deck.output
#puts deck.suits
#puts deck.ranks
