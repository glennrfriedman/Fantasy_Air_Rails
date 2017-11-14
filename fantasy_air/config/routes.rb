Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/players/:full_name/:team' => 'players#show_one', :as => :players
  get '/players' => 'players#show_all', :as => :all_players_data
  get '/players/:week' => 'players#find_by_week', :as => :all_players_data_per_week
end
