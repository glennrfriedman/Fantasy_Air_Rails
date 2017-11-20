Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # route to show entire database dataset
  get '/allplayerslist' => 'players#show_all_season', :as => :all_players_data_weekly
  # route to show list of all players
  get '/playerlist' => 'players#player_list', :as => :all_players_list
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
  # route to show one positions dataset for one week
  get '/showWeek' => 'players#show_week', :as => :show_week
  # route to show team list
  get '/teamlist/:week' => 'players#team_list', :as => :team_list
  # route to show team
  get '/:team/:week' => 'players#show_team_data', :as => :show_team

end
