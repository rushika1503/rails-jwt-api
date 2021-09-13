class UsersController < ApplicationController
    before_action :authorize_request, except: :create
    

    def create
      result = Users::Registration.run(user_params)
      if result.success?
        render json: result.fixtures['user']
      else
        render json: { error: result.message }, status: :unauthorized
        
      end
    end
  
    
    def user_params
      params.permit(
          :name, :username, :email, :password, :password_confirmation
      )
    end
  end