class Stock

  attr_accessor :srno, :name, :symbol, :url, :index, :peratio, :eps

  @@all = []

  def initialize(stock_array)

    @@all << self
  end


  def self.all
    puts "All the stocks"
  end



end
