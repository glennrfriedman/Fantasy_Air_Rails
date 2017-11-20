namespace :data do
	# environment loads all models and everything we normally use with a rails console open
	desc "import data from Airyards API"
	task :get_data => :environment do
		Player.delete_all
		puts "Hello data"
		original_data_2017 = HTTParty.get("http://airyards.com/2017/weeks")
		dataset_2017 = JSON.parse(original_data_2017.body)
		# puts (dataset_2017)
		dataset_2017.each do |player|
			Player.create!(player)
		end 
	end 
end 