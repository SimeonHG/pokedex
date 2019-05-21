Rails.application.routes.draw do
	resources :pokemons
	api_version(:module => "V1", :path => {:value => "v1"}) do
	end  
	
end