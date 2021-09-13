require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /users' do
    it 'Registers the user' do
     post '/users', params: { name: 'userfour4', email: 'user44@dev.com',username: 'userfour4', password: '123456', password_confirmation:'123456' } 
      puts(response.body)
      expect(response).to have_http_status(:ok)
    end

    it 'Registers the user with invalid params' do
      post '/users', params: { name: 'userfour4' ,username: 'userfour4', password: '123456', password_confirmation:'123456' } 
      puts(response.body)
      expect(response).to have_http_status(:unauthorized)
    end
  end
end