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

  def display_list
    array = Scraper.scrape_screener
    stock = Stock.new(array)
    Stock.all.each do |stock|
    puts "Enter a valid symbol for more information or enter 'quit' to exit the program"
    puts "#{stock.name} .... #{stock.symbol}"
    end
  end


  def call
    puts "To view a list of stocks enter list or enter 'quit' to exit the program"
    input_1 = gets.strip
    if["list","quit"].include? input_1.downcase
      if input_1.downcase == "list"
        # should display objects which are instances of stocks with name and symbols
        display_list
      elsif input_1.downcase == "quit"
        puts "You have chosen to exit the app"
      end
    else
      puts "Please enter a valid option"
      call
    end
  end

end
