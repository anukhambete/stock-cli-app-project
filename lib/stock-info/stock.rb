class Stock

  attr_accessor :srno, :name, :symbol, :url, :index, :peratio, :eps

  @@all = []

  # The instances of stocks should be initialized with an array that includes information that was scraped
  # using the scraper class

  def initialize(array)
    stock_array = array
    @symbol = stock_array[0]
    @name = stock_array[1]
    @@all << self
  end

  def self.create_from_scraper_array(outer_array)
    outer_array.each do |inner_array|
      stock = Stock.new(inner_array)
    end
  end


  def self.all
    @@all
  end



end
