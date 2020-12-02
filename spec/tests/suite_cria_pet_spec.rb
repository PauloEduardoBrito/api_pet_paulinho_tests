require_relative '../../app/pet.rb'
require_relative '../supports/factories/Fabria_cria_pet/fabrica_cria_pet.rb'

describe 'criando meu pet'do
    subject(:pet) {PetApi.new}
    let(:obj_pet)     {attributes_for(:attr_fabrica_cria_pet)}
    
    context'testes de criar pet'do

        it'validando a criacao do pet'do
            puts data_pet_criado = pet.cria_novo_pet(obj_pet)
            puts id_pet = data_pet_criado['id']
            expect(data_pet_criado.code).to eq(200)
            expect(data_pet_criado['id']). to eq(id_pet)
        end
    end
    
    context'Atualiza um pet'do
        it "atualizando um pet" do
            data_pet_criado = pet.cria_novo_pet(obj_pet)
            obj_pet['id'] = data_pet_criado['id']
            obj_pet['status'] = 'pending'
            data_atualizando_Pet = pet.atualiza_um_pet_existente(obj_pet)
            puts data_atualizando_Pet
            expect(data_pet_criado['status']).to eq('available')
            expect(data_atualizando_Pet.code).to eq(200)
            expect(data_atualizando_Pet['status']).to eq('pending')
        end
        
        it "atualiza pet por formulario passando o pet id" do
            data_pet_criado = pet.cria_novo_pet(obj_pet)
            puts data_pet_criado
            returo_pet_criado = data_pet_criado['id']
            atualiza_pet = pet.atualiza_pet_por_pet_id_com_forms(returo_pet_criado, 'novo_nome', 'sold')
            puts busca_pet = pet.buca_por_pet_id(atualiza_pet['message'])
            expect(atualiza_pet.code).to eq(200)
            expect(busca_pet['id']).to eq(returo_pet_criado)
            expect(busca_pet['status']).to eq('sold')
            expect(busca_pet['name']).to eq('novo_nome')
        end
    end
    context 'busca Pets' do
        it 'buscando pelo status pending'do
            obj_pet['status'] = 'pending'
            data_pet_criado = pet.cria_novo_pet(obj_pet)
            puts data_pet_criado['id']
            puts data_pet_criado['status']
            busca_por_status = pet.busca_por_status('pending')
            puts resultado_busca = busca_por_status.select { |result| result['id'] == data_pet_criado['id']}
            expect(busca_por_status.code).to eq(200)
            expect(resultado_busca[0]['id']).to eq(data_pet_criado['id'])
            expect(resultado_busca[0]['status']).to eq('pending')
        end

        it 'buscando um pet pelo pet_id' do
            data_pet_criado = pet.cria_novo_pet(obj_pet)
            puts data_pet_criado['id']
            puts busca_pet = pet.buca_por_pet_id(data_pet_criado['id'])
            expect(busca_pet.code).to eq(200)
            expect(busca_pet['id']).to eq(data_pet_criado['id'])
        end
    end
    
    context "deletando pet" do
        
        it 'deletando um pet pelo id' do
            data_pet_criado = pet.cria_novo_pet(obj_pet)
            puts retorno = data_pet_criado['id']
            delete_pet = pet.deleta_pet(retorno)
            #puts busca_pet = add_pet.buca_por_pet_id(retorno)
            expect(delete_pet.code).to eq(200)
            expect(delete_pet['message']).to eq("#{retorno}")
            # expect(busca_pet.code).to eq(404)
            # expect(busca_pet['message']).to eq("Pet not found")
        end
    end
end