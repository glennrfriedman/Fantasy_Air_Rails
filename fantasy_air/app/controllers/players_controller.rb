class PlayersController < ApplicationController

	def show_all 
		render json: Player.all
	end 
	
	def show_one
		full_name = params[:full_name]
		team = params[:team]
		render json: Player.where(full_name: full_name, team: team) 
	end 

	def find_by_week
		week = params[:week]
		render json: Player.where(week: week)
	end 

end
