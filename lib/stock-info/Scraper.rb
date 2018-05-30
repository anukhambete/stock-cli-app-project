require 'open-uri'
require 'pry'
require 'nokogiri'

# The Scraper class should have two methods
# The first method should be used to scrape the name, symbol, market cap
# url etc. from the main page for all the stocks
# The second method should scrape information about the individual stock
# The second method should scrape the EPS P/E ratio and the Index

class Scraper

finviz = Nokogiri::HTML(open("https://finviz.com/screener.ashx?v=111&f=cap_mega,exch_nasd"))

  def self.scrape_screener
    array_main = []
    fin = finviz.css("div#screener-content").css("td").css("tr[valign=top]")

    temp = []
    symbol = fin.css("td")[1].text
    name = fin.css("td")[2].text
    temp << symbol
    temp << name

    array_main << temp
    array_main

  end


end
