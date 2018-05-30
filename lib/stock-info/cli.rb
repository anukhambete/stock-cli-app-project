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


  def create_stocks
      outer_array = Scraper.scrape_screener
      Stock.create_from_scraper_array(outer_array)
  end


  def display_list
    Stock.all.each do |stock|
    puts "#{stock.name} .... #{stock.symbol}"
    end
    puts "Enter a valid symbol for more information or enter 'quit' to exit the program"
  end


  def call
    puts "To view a list of stocks enter list or enter 'quit' to exit the program"
    input_1 = gets.strip
    if["list","quit"].include? input_1.downcase
      if input_1.downcase == "list"
        # should display objects which are instances of stocks with name and symbols
        create_stocks
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
