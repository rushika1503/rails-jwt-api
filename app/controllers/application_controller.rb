class ApplicationController < ActionController::API

  def authorize_request
   result = Sessions::TokenVerifier.run(
     request.headers['Authorization'],
     Sessions::TokenEncoder
    )
    
    if result.success?
      render json: result.fixtures['tokenVerify']
    else
      render json: { error: result.message }, status: :unauthorized
    end
  end

end