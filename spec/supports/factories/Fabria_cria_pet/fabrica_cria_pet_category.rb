require_relative '../../../supports/models/modelo_cria_pet/model_cria_pet_category.rb'


FactoryBot.define do
    factory :attr_fabrica_cria_pet_category, class: ModelCriaPetCategory do
        id   {Faker::Number.leading_zero_number(digits: 4)}
        name {Faker::Creature::Animal.name}
    end

end
