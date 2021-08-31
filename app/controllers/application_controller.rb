class ApplicationController < ActionController::API

  def authorize_request
    header = request.headers['Authorization']
    # header = header.split(' ').last if header
    # begin
    #   @decoded = JsonWebToken.decode(header)
    #   @current_user = User.find(@decoded[:user_id])
    # rescue ActiveRecord::RecordNotFound => e
    #   render json: { errors: e.message }, status: :unauthorized
    # rescue JWT::DecodeError => e
    #   render json: { errors: e.message }, status: :unauthorized
   # end
   result = Sessions::TokenVerifier.run(
     header: request.headers['Authorization'],
      decoder: Sessions::TokenEncoder,
    )
    render json: { errors: result.message }, status: :unauthorized unless result.success?
  end
  
end