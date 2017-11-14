namespace :data do
	# environment loads all models and everything we normally use with a rails console open
	desc "import data from Airyards API"
	task :get_data => :environment do
		puts "Hello data"
		url = "http://airyards.com/2017/weeks"
		original_data_2017 = HTTParty.get(url)
		dataset_2017 = JSON.parse(original_data_2017.body)
		# puts (dataset_2017)
		dataset_2017.each do |player|
			Player.create!(player)
			# if (Player.where(full_name: player["full_name"]) + Player.where(team: player["team"])) == (player["full_name"] + player["team"])
			# 	puts 'did not add new player'
			# else 
			# 	Player.create(full_name: player["full_name"], position: player["position"], team: player["team"])
			# end 
		end 
	end 
end 