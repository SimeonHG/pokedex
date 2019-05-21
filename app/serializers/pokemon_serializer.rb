class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :primary_type, :secondary_type, :trainer_name, :hight, :weight, :gender,:region
end
