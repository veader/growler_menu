require "sinatra"
require "nokogiri"
require "open-uri"
require "json"

class GrowlerMenuApplication < Sinatra::Base
	set :static, true
	set :root, GrowlerMenuApplication.root
	set :public_folder, File.join(APP_DIR, 'public')

	get "/" do
		send_file File.join(APP_DIR, 'public/index.html')
	end

	get "/beers" do
		menu_url = "http://www.beergrowlernation.com/opening/?q=beermenu"
		doc = Nokogiri::HTML(open(menu_url))

		rows = []
		doc.css("div.view-content table tbody tr").each do |table_row|
			row = table_row.css('td').collect { |col| col.content.strip }
			row.shift # empty image row first...
			rows << row
		end
		rows.pop # last row is the footer at the bottom of the page

		beers = \
			rows.collect do |row|
				{ brewer: 		 row[0],
				  location: 	 row[1],
					description: row[2],
					abv: 				row[3],
					type: 			 row[4],
				}
			end

		{ beers: beers }.to_json
	end
end
