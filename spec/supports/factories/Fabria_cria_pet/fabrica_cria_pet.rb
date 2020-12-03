require_relative '../../../supports/models/modelo_cria_pet/model_cria_pet.rb'
require_relative '../../../supports/factories/Fabria_cria_pet/fabrica_cria_pet_tags.rb'
require_relative '../../../supports/factories/Fabria_cria_pet/fabrica_cria_pet_category.rb'

FactoryBot.define do

    factory :attr_fabrica_cria_pet, class: ModelCriaPet do
        id{Faker::Number.leading_zero_number(digits: 12)}
        category{attributes_for(:attr_fabrica_cria_pet_category)}
        name{Faker::Name.name}
        photoUrls{[Faker::Internet.url]}
        tags{[attributes_for(:attr_facrica_cria_pet_tags)]}
        status{'available'}

        trait :status_pending do
            status{'pending'}
        end

        trait :status_sold do
            status{'sold'}
        end
    end

end
