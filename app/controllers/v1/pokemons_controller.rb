class PokemonsController < ApplicationController
	def index
		pokemons = Pokemon.all
		render json{pokemons: pokemons}, status: :ok
	end
end
