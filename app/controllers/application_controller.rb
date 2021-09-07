class ApplicationController < ActionController::API

  def authorize_request
    byebug
    # header = request.headers['Authorization']
    # header = header.split(' ').last if header
    # begin
    #   @decoded = JsonWebToken.decode(header)
    #   @current_user = User.find(@decoded[:user_id])
    # rescue ActiveRecord::RecordNotFound => e
    #   render json: { errors: e.message }, status: :unauthorized
    # rescue JWT::DecodeError => e
    #   render json: { errors: e.message }, status: :unauthorized
   # end
   byebug
   result = Sessions::TokenVerifier.run(
     request.headers['Authorization'],
     Sessions::TokenEncoder
    )
    
    render json: { errors: result.message }, status: :unauthorized unless result.success?
  end

end