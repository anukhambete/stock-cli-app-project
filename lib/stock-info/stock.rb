class Stock

  attr_accessor :srno, :name, :symbol, :url, :index, :peratio, :eps

  @@all = []

  def initialize
    stock_array = ["MSFT", "Microsoft"]
    @symbol = stock_array[0]
    @name = stock_array[1]
    @@all << self
  end


  def self.all
    @@all
  end



end
