Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # route to show entire database dataset
  get '/players' => 'players#show_all_season', :as => :all_players_data_weekly
  # route to display all results for player name from entire dataset
  get '/players/:full_name/' => 'players#player_search_results', :as => :one_player_weekly_data_results
  # route to show one players entire dataset + shows season data
  get '/players/:full_name/:team' => 'players#show_one_all_weeks', :as => :one_player_weekly_data
  # route to show one weeks entire dataset
  get '/weeks/:week' => 'players#find_by_week', :as => :all_players_data_one_week
  # route to show one teams entire dataset
  get '/team/:team' => 'players#find_by_team', :as => :all_teams_data_all_weeks
  # route to show one positions entire dataset
  get '/position/:position' => 'players#find_by_position', :as => :one_position_data_all_weeks
  # route to show one positions dataset for one week
  get '/position/:position/:week' => 'players#find_by_position_one_week', :as => :one_position_data_one_week

end
