#require_relative "../stock-info/scraper.rb"
require_relative "../stock-info/stock.rb"
require_relative "../stock-info/Scraper.rb"
require 'nokogiri'
require 'pry'


class StockInfo::CLI

# The cli should display 2 options List and quit and accept a valid input
# if list then display the list of stocks and symbols --> create method called display_list
# the display_list method should display the stocks and ask the user to enter a valid symbol
# the display_list method should use the @@all array from the Stock class to display the list of stocks
# the create_stocks method should us the scraper and stock classes to create instances of stocks
# The display_additional_info method adds information about the stock that is available through the stock url
# like index, PE ratio and eps and the output should include basic information about the stock (from)
# the main web page as well as the information scraped from the stock url
#

  def create_stocks
      outer_array = Scraper.scrape_screener
      Stock.create_from_scraper_array(outer_array)
  end


  def display_list
    puts "   "
    Stock.all.each do |stock|
    puts stock.srno.ljust(5) + stock.symbol.ljust(10) + stock.name.rjust(5)
    end
    puts "   "
    puts "Enter a valid symbol for more information or enter 'quit' to exit the program"
    puts "   "
  end

  def display_additional_info(stock_symbol)
    stock = Stock.all.find {|stock| stock.symbol == stock_symbol}
    info = Scraper.scrape_stock_info("https://finviz.com/" + stock.url)    #Scraper.scrape_stock_info(url)
    stock.add_stock_info(info)
    puts "#{stock.name} index is #{stock.index}"
  end

  def call
    puts "To view a list of stocks enter list or enter 'quit' to exit the program"
    input_1 = gets.strip
    if["list","quit"].include? input_1.downcase
      if input_1.downcase == "list"
        # should display objects which are instances of stocks with name and symbols
        create_stocks
        display_list
        input_symbol = gets.strip
        display_additional_info(input_symbol)
      elsif input_1.downcase == "quit"
        puts "You have chosen to exit the app"
      end
    else
      puts "Please enter a valid option"
      call
    end
  end

end
