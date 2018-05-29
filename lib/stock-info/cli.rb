#require_relative "../stock-info/scraper.rb"
require_relative "../stock-info/stock.rb"
require 'nokogiri'
require 'pry'


class StockInfo::CLI

# The cli should display 2 options List and quit and accept a valid input
# if list then display the list of stocks and symbols --> create method called display_list
# the display_list method should display the stocks and ask the user to enter a valid symbol

  def display_list
    Stock.all
  end


  def call
    puts "To view a list of stocks enter list or to quit enter 'quit'"
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
