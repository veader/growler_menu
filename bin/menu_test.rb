#!/usr/bin/env ruby

require "rubygems"
require "nokogiri"
require "open-uri"
require "pp"


menu_url = "http://www.beergrowlernation.com/opening/?q=beermenu"
doc = Nokogiri::HTML(open(menu_url))
rows = []
doc.css("div.view-content table tbody tr").each do |table_row|
	row = table_row.css('td').collect { |col| col.content.strip }
	row.shift # empty image row first...
	rows << row
end
rows.pop # last row is the footer at the bottom of the page
pp rows

