class PlayersController < ApplicationController

	def show_all_season
		player_data = Player.all
		render json: player_data
		# player_data.each do |player|
		# render json: {
		# 		full_name: player.full_name,
		# 		full_name: player.position,
		# 		full_name: player.team,
		# 		air_yards: player.sum(:air_yards),
		# 		tar: player.sum(:tar),
  	#     rec: player.sum(:rec),
  	#     rec_yards: player.sum(:rec_yards),
  	#     yac: player.sum(:yac),
  	#     tm_att: player.sum(:tm_att),
  	#     tm_airyards: player.sum(:tm_airyards),
  	#     aypt: (player.sum(:air_yards).to_f)/(player.sum(:tar)),
  	#     racr: (player.sum(:rec_yards).to_f)/(player.sum(:air_yards)),
  	#     ms_air_yards: (player.sum(:air_yards).to_f)/(player.sum(:tm_airyards)),
  	#     target_share: (player.sum(:tar).to_f)/(player.sum(:tm_att)),
  	#     wopr: player.average(:wopr)
		# 		}
		# 	end 
	end

	def show_results_all_weeks
		# player_search = params[:full_name]
		# LOOK INTO THIS
		# User.where(users[:name].matches("%#{user_name}%"))
		# players = Player.arel_table
		# player_results = Player.where(players[:full_name].matches("%#{player_search}%"))
		# player_results = Player.where('full_name LIKE ?', '%player_search%').all
		# player_results = Player.where("player.full_name LIKE :full_name", {:full_name => "#{player_search}%"})
		# player_results = Player.where(full_name LIKE "?", player_search)
		player_data = Player.where('full_name LIKE ?', "%#{params[:full_name]}%").order(:full_name)
		render json: {
			player_results: player_data
		}
	end
	
	def show_one_all_weeks
		full_name = params[:full_name]
		team = params[:team]
		player_data = Player.where(full_name: full_name, team: team)
		# render json: player_data 
		render json: {
			season_stats: {
				air_yards: player_data.sum(:air_yards),
				tar: player_data.sum(:tar),
        rec: player_data.sum(:rec),
        rec_yards: player_data.sum(:rec_yards),
        yac: player_data.sum(:yac),
        tm_att: player_data.sum(:tm_att),
        tm_airyards: player_data.sum(:tm_airyards),
        aypt: (player_data.sum(:air_yards).to_f)/(player_data.sum(:tar)),
        racr: (player_data.sum(:rec_yards).to_f)/(player_data.sum(:air_yards)),
        ms_air_yards: (player_data.sum(:air_yards).to_f)/(player_data.sum(:tm_airyards)),
        target_share: (player_data.sum(:tar).to_f)/(player_data.sum(:tm_att)),
        wopr: player_data.average(:wopr)
				},
				player_data: player_data
			}
	end 

	def find_by_week
		week = params[:week]
		render json: Player.where(week: week)
	end

	def find_by_position
		position = params[:position]
		render json: Player.where(position: position)
	end 

	def find_by_position_one_week
		position = params[:position]
		week = params[:week]
		render json: Player.where(position: position, week: week)
	end

end
