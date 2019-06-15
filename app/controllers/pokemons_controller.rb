class PokemonsController < ApplicationController
	#pokemon = Pokemon.find(params[:id])
	def index
		pokemons = Pokemon.all
		render json: pokemons, status: :ok
	end

	def create
		pokemon = Pokemon.new(pokemon_params)
		if pokemon.save
			render json: pokemon, status: :created, location: 'pokemons/' + pokemon.id.to_s
			#p "hi"
		else
			render json: {errors: pokemon.errors}, status: :unprocessable_entry
		end

	end

	def show
		pokemon = Pokemon.find(params[:id])
		render json: pokemon, status: :ok
	end

	def update
    	pokemon = Pokemon.find(params[:id])

  	  	if pokemon.update(pokemon_params)
     		render json: pokemon, status: :ok
    	else
      		render json: { errors: pokemon.errors }, status: :unprocessable_entity
    	end
  	end

  	def destroy
  		pokemon = Pokemon.find(params[:id])
  		pokemon.destroy
  	end

	def pokemon_params
		params.require(:pokemon).permit(:name, :level, :primary_type, :secondary_type, :trainer_name, :hight, :weight, :gender,:region)
	end
end
