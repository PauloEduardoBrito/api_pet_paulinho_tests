require_relative '../../../supports/models/modelo_cria_pet/model_cria_pet_tags.rb'


FactoryBot.define do
    
    factory :attr_facrica_cria_pet_tags, class: ModelCriaPetTags do
        id   {Faker::Number.leading_zero_number(digits: 3)}
        name {Faker::Creature::Animal.name}
    end

end