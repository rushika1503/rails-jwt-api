require 'rails_helper'

RSpec.describe "Authentications", type: :request do
    describe 'POST auth/login' do
        let(:user) { create(:user) }
        it 'Signins the user' do
        post '/auth/login', params: { email: user.email, password: '123456'} 
        puts(response.body)
        expect(response).to have_http_status(:created)
        end
        
        it 'email does not exist or password incorrect' do
            post '/auth/login', params: { email: 'user4@dev.com', password: '123456' }
            expect(response).to have_http_status(:unauthorized)
        end


  end
end