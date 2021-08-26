require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /users' do
    it 'Registers the user' do
     post '/users', params: { name: 'userfour', email: 'user4@dev.com',username: 'userfour', password: '123456', password_confirmation:'123456' } 
      puts(response.body)
      expect(response).to have_http_status(:created)
    end

    # it 'Registers the user with invalid params' do
    #   post '/users', params: { name: 'userfour' ,username: 'userfour', password: '123456', password_confirmation:'123456' } 
    #   puts(response.body)
    #   expect(response).to have_http_status(:unprocessable_entity)
    # end
  end
end