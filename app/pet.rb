
class PetApi
#    post adiciona um novo pet
    def cria_novo_pet(objeto)
       uri = "#{ENV['BASE_URI']}/pet" 

       without_authentication('post', uri, objeto.to_json)
    end

#  put atualiza um pet existente
    def atualiza_um_pet_existente(objeto)
        uri = "#{ENV['BASE_URI']}/pet"
        
        without_authentication('put', uri, objeto.to_json)
    end

    # get Busca um pet pelo ID
    def busca_por_status(status)
        uri = "#{ENV['BASE_URI']}/pet/findByStatus?status=#{status}"
        
        without_authentication('get', uri)
    end
    
    #Busca um pet existente pelo pet Id
    def busca_por_pet_id(pet_id) 
        uri = "#{ENV['BASE_URI']}/pet/#{pet_id}"
        
        without_authentication('get', uri)
    end

    # Atualiza um pet na loja com os dados do formulário
    def atualiza_pet_por_pet_id_com_forms(pet_id, name, status)
        uri = "#{ENV['BASE_URI']}/pet/#{pet_id}"
        body = "name=#{name}&status=#{status}"
        
        without_authentication('post', uri, body, 'application/x-www-form-urlencoded')
    end

    # Deleta um pet pelo Id
    def deleta_pet(pet_id)
        uri = "#{ENV['BASE_URI']}/pet/#{pet_id}"

        without_authentication('delete', uri)
    end

end