class AuthenticationController < ApplicationController
  def login
  
     @user = User.find_by_email(params[:email])
     puts "hello"
    # # byebug
    # if @user&.authenticate(params[:password])
      # token = JsonWebToken.encode(user_id: @user.id)
      # time = Time.now + 24.hours.to_i
      # render json: @user, status: :created
      # render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                   #  name: @user.name }, status: :ok
        

    result = Sessions::Authenticator.run(
      email: params[:email],
      password: params[:password],
      jwt_encoder: Sessions::NewTokenEncoder,
    )
    
    if result.success?
      render json: result.fixtures['token']
    else
      render json: { error: result.message }, status: :unauthorized
    end
    #  result = Sessions::CreateTest.run()
 
  end
  # private

  # def login_params
  #   params.permit(:email, :password)
  # end
end