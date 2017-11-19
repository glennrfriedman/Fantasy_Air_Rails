class PlayersController < ApplicationController

	def show_all_season
		player_data = Player.all
		render json: player_data
	end

	def team_list 
		week = params[:week]
		team = Player.order(team: :asc).where(week: week).pluck(:team).uniq
		render json: {
			teams: team 
		}
	end 

	def show_team_data
		team = params[:team]
		week = params[:week]
		team_data = Player.where(team: team, week: week)
		render json: {
				team: team_data[0].team,
				tar: team_data.sum(:tar),
        rec: team_data.sum(:rec),
        rec_yards: team_data.sum(:rec_yards),
        yac: team_data.sum(:yac),
        tm_att: team_data[0].tm_att,
        tm_airyards: team_data[0].tm_airyards
			}
	end 

	def player_search_results
		search_results = []
		player_data = Player.where('LOWER(full_name) LIKE ?', "%#{params[:full_name].downcase}%").pluck(:full_name, :team, :position).uniq.take(5)
		render json: {
				search_results: player_data
		}
	end

	def show_week 
		weeks = Player.order(week: :desc).pluck(:week).uniq
		render json: {
			weeks: weeks
		}
	end

	def player_list
		player_data = Player.all.pluck(:full_name, :team, :position).uniq
		render json: {
				player_list: player_data
		}
	end 
	
	def show_one_all_weeks
		full_name = params[:full_name]
		team = params[:team]
		player_data = Player.where(full_name: full_name, team: team)
		# render json: player_data 
		render json: {
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
        wopr: player_data.average(:wopr),
				player_data: player_data
			}
	end 

	def find_by_week
		week = params[:week]
		render json: Player.where(week: week)
	end

	def find_by_team
		team = params[:team]
		render json: Player.where(team: team)
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
