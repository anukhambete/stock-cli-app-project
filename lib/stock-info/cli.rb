class StockInfo::CLI

# The cli should display 2 options List and quit and accept a valid input
# if list then display the list of stocks and symbols

  def call
    puts "To view a list of stocks enter list or to quit enter 'quit'"
    input_1 = gets.strip
    if["list","quit"].include? input_1.downcase
      if input_1.downcase == "list"
        # should display objects which are instances of stocks with name and symbols
        puts " stock and symbols"
      elsif input_1.downcase == "quit"
        puts "You have chosen to exit the app"
      end
    else
      puts "enter a valid option"
    end
  end

end
