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
  end

  def display_additional_info(stock_symbol)
    stock = Stock.all.find {|stock| stock.symbol == stock_symbol}
    info = Scraper.scrape_stock_info("https://finviz.com/" + stock.url)    #Scraper.scrape_stock_info(url)
    stock.add_stock_info(info)
    puts "#{stock.name} index is #{stock.index} and eps is #{stock.eps}"
    puts "   "
  end

  def input_for_additional_info
    valid_symbols = Stock.all.collect {|stock| stock.symbol}
    input_symbol = gets.strip
    if valid_symbols.include? input_symbol.upcase
    display_additional_info(input_symbol.upcase)
    call
    elsif input_symbol == "quit"
    puts "You are returning to the main menu"
    puts "   "
    call
    else
    puts "Enter a valid symbol for more information or enter 'quit' to return to the main menu"
    input_for_additional_info
    end
  end

# The call method should
# (1) Main menu list options : (a) List of stocks (b) quit
  # (a) If the user picks a stock from the list a method to display additional information
  # about the stock should be called and then go back to the main menu
  # The symbol entered should be valid?
# (2) Call the appropriate method after the user makes their choice
# (3) Print an error message if the option is invalid and list the options again



  def call
    puts "(a) To view a list of stocks enter list"
    puts "(b) To exit the program enter 'quit'"

    input_1 = gets.strip
    if["list","quit"].include? input_1.downcase
      if input_1.downcase == "list"
        create_stocks
        display_list
        puts "Enter a valid symbol for more information or enter 'quit' to exit the program"
        puts "   "
        input_for_additional_info

      elsif input_1.downcase == "quit"
        puts "You have chosen to exit the app"
      end
    else
      puts "Please enter a valid option"
      call
    end
  end

end
